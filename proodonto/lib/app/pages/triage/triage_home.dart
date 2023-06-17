import 'package:flutter/material.dart';
import 'package:proodonto/app/pages/triage/register_triage_basic_info.dart';
import 'package:proodonto/app/widget/buttons.dart';

class TriageHome extends StatefulWidget {
  const TriageHome({Key? key}) : super(key: key);

  @override
  State<TriageHome> createState() => _TriageHomeState();
}

class _TriageHomeState extends State<TriageHome> {
  int _currentStep = 0;
  late int _max;

  List<Step> _getSteps() => [
      Step(
        title: const Text("Registro da triagem",),
        content: TriageBasicInfoForm(),
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 0
      ),
    ];

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
        onStepTapped: (step) => setState(() => _currentStep = step),
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
}
