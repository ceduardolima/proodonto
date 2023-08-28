import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/pages/patient/step/register_patient_informations.dart';
import 'package:proodonto/app/pages/patient/step/register_records.dart';
import 'package:proodonto/app/pages/patient/step/register_patient_responsible.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/widget/buttons.dart';
import 'package:uuid/uuid.dart';

import '../../database/entity/favorites_patients.dart';

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
  late List<RegisterForm> formList;
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

  void _onStepTapped(int step) {
    if (step > _currentStep) {
      if (_getFormIfHasNoEmptyField()) {
        _currentStep = step;
      }
    } else {
      _currentStep = step;
    }
  }

  bool _getFormIfHasNoEmptyField() {
    final form = formList[_currentStep];
    bool isValid = form.validate();
    if (isValid) {
      form.getFields(patient);
      return true;
    }
    return false;
  }

  Future<void> _showDuplicateRecordNumberDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Icon(
            Icons.error_outline,
            color: Colors.red,
          )),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                  child: Text(
                    'O número de prontuário inserido já existe.\n'
                    'Por favor, coloque um número válido para que possamos prosseguir.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _nextStep(ControlsDetails details, bool isLastStep) async {
    if (isLastStep) {
      _finishRegistry(context, responsibleForm.patient);
    } else {
      RegisterForm form = formList[_currentStep];
      if (form.validate()) {
        patient = form.getFields(patient);
        if (_currentStep == 0) {
          bool isDuplicated = await _isRecordDuplicated(patient.recordNumber!);
          if (!isDuplicated) {
            details.onStepContinue!();
          } else {
            _showDuplicateRecordNumberDialog();
          }
        } else {
          details.onStepContinue!();
        }
      }
    }
  }

  Future<bool> _isRecordDuplicated(int recordNumber) async {
    int? numberOfDuplicate =
        await _database.patientDao.countPatientByRecord(patient.recordNumber!);
    return numberOfDuplicate != null && numberOfDuplicate != 0;
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
        onStepTapped: (step) => setState(() => _onStepTapped(step)),
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
                      _nextStep(details, isLastStep);
                    },
                    text: isLastStep ? "REGISTRAR" : "PRÓXIMO",
                  ),
                ),
                if (!isFirstStep)
                  const SizedBox(
                    width: 10,
                  ),
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
    patient.id = const Uuid().v4().replaceAll("-", "");
    patient.isFavorite = true;
    await _database.patientDao.insert(patient);
    await _database.favoritesPatientsDao.insert(FavoritePatient(patient.id!));
    await Future.delayed(const Duration(seconds: 2));
  }
}
