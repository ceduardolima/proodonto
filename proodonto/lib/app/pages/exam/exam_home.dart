import 'package:flutter/material.dart';
import 'package:proodonto/app/database/entity/exam.dart';
import 'package:proodonto/app/widget/buttons.dart';

class ExamHome extends StatelessWidget {
  const ExamHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exame"),
      ),
      body: const _ExamStepper(),
    );
  }
}

class _ExamStepper extends StatefulWidget {
  const _ExamStepper({Key? key}) : super(key: key);

  @override
  State<_ExamStepper> createState() => _ExamStepperState();
}

class _ExamStepperState extends State<_ExamStepper> {
  late int _max;
  int _currentStep = 0;
  Exam exam = Exam();

  @override
  void initState() {
    super.initState();
    _max = _getSteps().length;
  }

  StepState setStepState(int state) =>
      _currentStep > state ? StepState.complete : StepState.indexed;

  List<Step> _getSteps() => [
        Step(
            title: Text("Informações básicas"),
            content: Container(),
            state: setStepState(0),
            isActive: _currentStep >= 0)
      ];

  void onStepContinue() {
    setState(() => _currentStep =
        (_currentStep >= _max) ? _currentStep : _currentStep + 1);
  }

  void onStepCancel() {
    setState(() =>
        _currentStep = (_currentStep <= 0) ? _currentStep : _currentStep - 1);
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
                  onPressed: details.onStepContinue!,
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
    );
  }
}
