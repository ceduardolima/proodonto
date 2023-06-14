import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/interfaces/patient_form_abstraction.dart';
import 'package:proodonto/app/pages/patient/register_patient_informations.dart';
import 'package:proodonto/app/pages/patient/register_patient_responsible.dart';
import 'package:proodonto/app/pages/patient/register_records.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/widget/buttons.dart';

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  State<StatefulWidget> createState() {
    return _PatientHomePageState(database);
  }
}

class _PatientHomePageState extends State<PatientHomePage> {
  final ProodontoDatabase _database;
  int _currentStep = 0;
  late int _max;
  late RegisterRecordsForm recordsForm;
  late RegisterPatientForm patientForm;
  late PatientResponsibleForm responsibleForm;
  late List<PatientForm> formList;
  Patient patient = Patient();

  _PatientHomePageState(this._database);

  @override
  void initState() {
    recordsForm = RegisterRecordsForm(patient: patient);
    patientForm = RegisterPatientForm(patient: patient);
    responsibleForm = PatientResponsibleForm(patient: patient);
    formList = [recordsForm, patientForm, responsibleForm];
    _max = _getSteps().length - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pacientes"),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: _getSteps(),
        currentStep: _currentStep,
        onStepContinue: () => setState(() => _currentStep =
            (_currentStep >= _max) ? _currentStep : _currentStep + 1),
        onStepCancel: () => setState(() => _currentStep =
            (_currentStep == 0) ? _currentStep : _currentStep - 1),
        onStepTapped: (step) => setState(() => _currentStep = step),
        controlsBuilder: (context, details) {
          bool isLastStep = _currentStep == _getSteps().length - 1;
          bool isFirstStep = _currentStep == 0;

          return Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: DefaultButton(
                    onPressed: () {
                      if (isLastStep) {
                        _finishRegistry(context, responsibleForm.patient);
                      } else {
                        PatientForm form = formList[_currentStep];
                        if (form.validate()) {
                          patient = form.getFields(patient);
                          details.onStepContinue!();
                        }
                      }
                    },
                    text: isLastStep ? "REGISTRAR" : "PRÓXIMO",
                  ),
                ),
                if (!isFirstStep) const SizedBox(width: 10,),
                if (!isFirstStep)
                  Expanded(
                    child: DefaultButton(
                      onPressed: () => details.onStepCancel!(),
                      text: "VOLTAR",
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
          title: Text("Registro"),
          content: recordsForm.build(context),
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0),
      Step(
          title: Text("Paciênte"),
          content: patientForm.build(context),
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1),
      Step(
          title: Text("Responsável"),
          content: responsibleForm.build(context),
          state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 2),
    ];
  }

  void _finishRegistry(BuildContext context, Patient patient) {
    _registerPatient(patient);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Cadastro Finalizado")));
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    database: _database,
                  )),
          (route) => false);
    }
  }

  void _registerPatient(Patient patient) async {
    await _database.patientDao.insert(patient);
    await Future.delayed(const Duration(seconds: 2));
  }
}
