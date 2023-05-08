import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proodonto/ui/exam/register_exam.dart';
import 'package:proodonto/ui/patient/patient_home.dart';
import 'package:proodonto/ui/triage/register_triage.dart';
import 'package:proodonto/utils/default_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _changeToPatientHomePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PatientHomePage()));
  }

  void _changeToTriageHomePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterTriageHome()));
  }

  void _changeToExamHomePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterExamHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => _changeToPatientHomePage(context), child: Text("Paciêntes")),
            ElevatedButton(onPressed: () => _changeToTriageHomePage(context), child: Text("Triagem")),
            ElevatedButton(onPressed: () => _changeToExamHomePage(context), child: Text("Exames")),
            ElevatedButton(onPressed: () {}, child: Text("Anamnese"))
          ],
        ),
      ),
    );
  }
}
