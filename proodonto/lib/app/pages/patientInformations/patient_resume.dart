import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/pages/patientInformations/informations/patient_exam_info.dart';
import 'package:proodonto/app/pages/patientInformations/informations/triage_info_data.dart';
import 'package:proodonto/app/shared/change_visibility_icon_button.dart';
import 'package:proodonto/app/shared/default_size.dart';

import '../../database/entity/exam.dart';
import '../../database/entity/triage.dart';
import 'informations/patient_personal_info.dart';

class PatientResume extends StatelessWidget {
  const PatientResume({
    super.key,
    required this.patient,
    required this.database,
    required this.exam,
    required this.triage,
  });

  final ProodontoDatabase database;
  final Patient patient;
  final Exam exam;
  final Triage triage;
  static const double _startPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingSize.medium),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
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
            ChangeVisibilityIconButton(
              text: "Exam",
              child: Padding(
                padding: const EdgeInsets.only(left: _startPadding),
                child: ExamInfo(
                  exam: exam,
                  database: database,
                ),
              ),
            ),
            ChangeVisibilityIconButton(
              text: "Triagem",
              child: Padding(
                padding: const EdgeInsets.only(left: _startPadding),
                child: TriageInfoData(
                  database: database,
                  triage: triage,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
