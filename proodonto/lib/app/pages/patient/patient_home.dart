import 'package:flutter/material.dart';
import 'package:proodonto/ui/patient/register_patient.dart';
import 'package:proodonto/app/ui/patient/register_records.dart';
import 'package:proodonto/app/ui/patient/search_patient.dart';
import '../../../utils/default_size.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pacientes"),
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: PaddingSize.big),
          child: _PatientHomePageContent()),
    );
  }
}

class _PatientHomePageContent extends StatelessWidget {
  const _PatientHomePageContent({Key? key}) : super(key: key);

  void _changeToRegisterPatient(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterRecordsHome()));
  }
  
  void _changeToSearchPatient(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SearchPatientHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          child: Text("Pesquisar"),
          onPressed: () => _changeToSearchPatient(context),
        ),
        ElevatedButton(
          child: Text("Cadastrar"),
          onPressed: () => _changeToRegisterPatient(context),
        ),
      ],
    );
  }
}
