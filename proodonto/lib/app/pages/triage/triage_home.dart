import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/triage.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/pages/triage/register_triage.dart';
import 'package:proodonto/app/pages/triage/register_triage_basic_info.dart';
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
                      RegisterForm form = formList[_currentStep];
                      if (form.validate()) {
                        form.getFields(triage);
                        if (isLastStep) {
                          _finishRegistryTriage(context);
                        } else {
                          details.onStepContinue!();
                        }
                      }
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
