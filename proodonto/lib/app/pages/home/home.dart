import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/anamnesis/register_anamnesis.dart';
import 'package:proodonto/app/pages/exam/register_exam.dart';
import 'package:proodonto/app/pages/patient/patient_home.dart';
import 'package:proodonto/app/pages/triage/register_triage.dart';
import 'package:proodonto/app/shared/default_size.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  void _changeToPatientHomePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PatientHomePage(database: database)));
  }

  void _changeToTriageHomePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegisterTriageHome(database: database)));
  }

  void _changeToExamHomePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegisterExamHome(database: database)));
  }

  void _changeToAnamnesisHome(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegisterAnamnesisHome(database: database)));
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
            ElevatedButton(onPressed: () => _changeToAnamnesisHome(context), child: Text("Anamnese"))
          ],
        ),
      ),
    );
  }
}
