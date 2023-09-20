import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/pages/anamnesis/step/anamnesis_basic_info.dart';
import 'package:proodonto/app/pages/anamnesis/step/anamnesis_register.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/shared/alert_dialog.dart';
import 'package:proodonto/app/widget/buttons.dart';

import '../../database/entity/anamnesis.dart';
import '../../theme/colors.dart';
import '../../theme/main_theme.dart';

class AnamnesisHome extends StatelessWidget {
  const AnamnesisHome({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anamnese"),
        elevation: 0.0,
      ),
      body: _AnamnesisStepper(
        database: database,
      ),
    );
  }
}

class _AnamnesisStepper extends StatefulWidget {
  const _AnamnesisStepper({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  State<_AnamnesisStepper> createState() => _AnamnesisStepperState();
}

class _AnamnesisStepperState extends State<_AnamnesisStepper> {
  late int _max;
  int _currentStep = 0;
  Anamnesis anamnesis = Anamnesis();
  late List<RegisterForm> formList;

  @override
  void initState() {
    super.initState();
    formList = [
      AnamnesisBasicInfoStep(
        anamnesis: anamnesis,
      ),
      AnamnesisRegister(
        anamnesis: anamnesis,
      )
    ];
    _max = _getSteps().length;
  }

  StepState setStepState(int state) =>
      _currentStep > state ? StepState.complete : StepState.indexed;

  List<Step> _getSteps() => [
        Step(
            title: Text("Informações do paciênte", style: TextStyle(color: Colors.white),),
            content: formList[0],
            state: setStepState(0),
            isActive: _currentStep >= 0),
        Step(
            title: Text("Anamnese", style: TextStyle(color: Colors.white),),
            content: formList[1],
            state: setStepState(1),
            isActive: _currentStep >= 1),
      ];

  void onStepContinue() {
    setState(() => _currentStep =
        (_currentStep >= _max) ? _currentStep : _currentStep + 1);
  }

  void onStepCancel() {
    setState(() =>
        _currentStep = (_currentStep <= 0) ? _currentStep : _currentStep - 1);
  }

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
    await widget.database.anamnesisDao.insert(anamnesis);
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
      form.getFields(anamnesis);
      return true;
    }
    return false;
  }

  void _nextStep(BuildContext context, bool isLastStep, ControlsDetails details) async {
    bool isValid = _getFormIfHasNoEmptyField();
    if (isValid) {
      bool recordExist = await recordNumberExist(anamnesis.recordNumber!);
      if (context.mounted) {
        if (recordExist) {
          if (isLastStep) {
            _finishRegistryTriage(context);
          } else {
            details.onStepContinue!();
          }
        } else {
          showAlertDialog(context, "Prontuário não existe");
        }
      }
    }
  }

  Future<bool> recordNumberExist(int recordNumber) async {
    int? records = await widget.database.patientDao.countPatientByRecord(recordNumber);
    return records != null && recordNumber > 0;
  }
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: ProodontoColors.primary,
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: ProodontoColors.ternary, onPrimary: Colors.white),
        inputDecorationTheme: MainInputTheme().inputTheme(),
        elevatedButtonTheme: MainInputTheme().elevatedButtonTheme(),

      ),
      child: Stepper(
        steps: _getSteps(),
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: onStepContinue,
        onStepCancel: onStepCancel,
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
                    text: isLastStep ? "REGISTRAR" : "PRÓXIMO",
                    onPressed: () => _nextStep(context, isLastStep, details),
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
