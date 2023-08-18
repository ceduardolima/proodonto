import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/anamnesis.dart';

import '../../database/entity/exam.dart';
import '../../database/entity/patient.dart';
import '../../database/entity/triage.dart';
import '../../shared/change_visibility_icon_button.dart';
import '../../shared/default_size.dart';
import 'informations/anamnesis_info_data.dart';
import 'informations/patient_exam_info.dart';
import 'informations/patient_personal_info.dart';
import 'informations/triage_info_data.dart';

class PatientInformationPage extends StatelessWidget {
  const PatientInformationPage({
    super.key,
    required this.database,
    required this.patient,
    required this.exam,
    required this.triage,
    required this.anamnesis,
  });

  final ProodontoDatabase database;
  final Patient patient;
  final Exam? exam;
  final Triage? triage;
  final Anamnesis? anamnesis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infomações do Paciênte"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: PaddingSize.medium,
            left: PaddingSize.medium,
            right: PaddingSize.medium,
            bottom: PaddingSize.large,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChangeVisibilityIconButton(
                text: 'Paciênte',
                child: PatientInformationData(
                  patient: patient,
                  database: database,
                ),
              ),
              if (exam != null)
                ChangeVisibilityIconButton(
                  text: "Exam",
                  child: ExamInfo(
                    exam: exam!,
                  ),
                ),
              if (triage != null)
                ChangeVisibilityIconButton(
                  text: "Triagem",
                  child: TriageInfoData(
                    triage: triage!,
                  ),
                ),
              if (anamnesis != null)
                ChangeVisibilityIconButton(
                  text: "Anamnese",
                  child: AnamnesisInfoData(
                    anamnesis: anamnesis!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
