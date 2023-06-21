import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/exam.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/pages/anamnesis/step/anamnesis_basic_info.dart';
import 'package:proodonto/app/pages/exam/step/exam_basic_info_step.dart';
import 'package:proodonto/app/pages/exam/step/exam_step.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/widget/buttons.dart';

import '../../database/entity/anamnesis.dart';

class AnamnesisHome extends StatelessWidget {
  const AnamnesisHome({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anamnese"),
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
      AnamnesisBasicInfoStep(anamnesis: anamnesis,)
    ];
    _max = _getSteps().length;
  }

  StepState setStepState(int state) =>
      _currentStep > state ? StepState.complete : StepState.indexed;

  List<Step> _getSteps() => [
        Step(
            title: Text("Informações básicas"),
            content: formList[0],
            state: setStepState(0),
            isActive: _currentStep >= 0),
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

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: _getSteps(),
      type: StepperType.horizontal,
      currentStep: _currentStep,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
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
                  text: isLastStep ? "REGISTRAR" : "PRÓXIMO",
                  onPressed: () {
                    if (isLastStep) {
                      _finishRegistryTriage(context);
                    } else {
                      details.onStepContinue!();
                    }
                  },
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
    );
  }
}
