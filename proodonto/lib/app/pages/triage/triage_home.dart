import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/triage.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/pages/triage/step/register_triage.dart';
import 'package:proodonto/app/pages/triage/step/register_triage_basic_info.dart';
import 'package:proodonto/app/shared/alert_dialog.dart';
import 'package:proodonto/app/widget/buttons.dart';

class TriageHome extends StatefulWidget {
  const TriageHome({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  State<TriageHome> createState() => _TriageHomeState();
}

class _TriageHomeState extends State<TriageHome> {
  int _currentStep = 0;
  late int _max;
  Triage triage = Triage();
  late List<RegisterForm> formList = [
    TriageBasicInfoForm(triage: triage),
    RegisterTriageForm(triage: triage)
  ];

  @override
  void initState() {
    super.initState();
    _max = _getSteps().length - 1;
  }

  List<Step> _getSteps() => [
        Step(
            title: const Text(
              "Informações básicas",
            ),
            content: formList[0],
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: _currentStep >= 0),
        Step(
            title: const Text(
              "Registro da triagem",
            ),
            content: formList[1],
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: _currentStep >= 1),
      ];

  void _finishRegistryTriage(BuildContext context) {
    _register();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Registro fializado")));
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    database: widget.database,
                  )),
          (route) => false);
    }
  }

  void _register() async {
    await widget.database.triageDao.insert(triage);
    await Future.delayed(const Duration(seconds: 2));
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
      form.getFields(triage);
      return true;
    }
    return false;
  }

  void changeStep(BuildContext context, bool isLastStep, ControlsDetails details) async {
    RegisterForm form = formList[_currentStep];
    if (form.validate()) {
      form.getFields(triage);
      bool recordNumberExist = await checkIfRecordNumberExist(triage.recordNumber!);
      if (context.mounted) {
        if (recordNumberExist) {
          if (isLastStep) {
            _finishRegistryTriage(context);
          } else {
            details.onStepContinue!();
          }
        } else {
          showAlertDialog(context, "Número de printuário não existe.");
        }
      }
    }
  }

  Future<bool> checkIfRecordNumberExist(int recordNumber) async {
    int? records = await widget.database.patientDao.countPatientByRecord(recordNumber);
    return records != null && records > 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Triagem"),
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
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: DefaultButton(
                    onPressed: () {
                      changeStep(context, isLastStep, details);
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
}
