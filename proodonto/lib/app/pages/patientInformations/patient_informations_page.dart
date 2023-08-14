import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/patientInformations/patient_resume.dart';

import '../../database/entity/exam.dart';
import '../../database/entity/patient.dart';
import '../../database/entity/triage.dart';
import '../../shared/default_size.dart';

class PatientInformationPage extends StatelessWidget {
  const PatientInformationPage({
    super.key,
    required this.database,
    required this.patient,
    required this.exam,
    required this.triage,
  });

  final ProodontoDatabase database;
  final Patient patient;
  final Exam exam;
  final Triage triage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infomações do Paciênte"),
      ),
      body: SingleChildScrollView(
        child: PatientResume(
          patient: patient,
          database: database,
          exam: exam,
          triage: triage,
        ),
      ),
    );
  }
}
