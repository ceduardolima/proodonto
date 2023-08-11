import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/patientInformations/patient_resume.dart';

import '../../database/entity/patient.dart';
import '../../shared/default_size.dart';

class PatientInformationPage extends StatelessWidget {
  const PatientInformationPage({super.key, required this.database, required this.patient});
  final ProodontoDatabase database;
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infomações do Paciênte"),
      ),
      body: _PatientInformation(database: database, patient: patient),
    );
  }
}

class _PatientInformation extends StatefulWidget {
  const _PatientInformation({super.key, required this.database, required this.patient});
  final ProodontoDatabase database;
  final Patient patient;

  @override
  State<_PatientInformation> createState() => _PatientInformationState();
}

class _PatientInformationState extends State<_PatientInformation> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: PatientResume(patient: widget.patient, database: widget.database,));
  }
}
