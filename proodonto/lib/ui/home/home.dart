import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proodonto/ui/patient/patient_home.dart';
import 'package:proodonto/utils/default_size.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _changeToPatientHomePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PatientHomePage()));
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
            ElevatedButton(onPressed: () {}, child: Text("Triagem")),
            ElevatedButton(onPressed: () {}, child: Text("Exames")),
            ElevatedButton(onPressed: () {}, child: Text("Anamnese"))
          ],
        ),
      ),
    );
  }
}
