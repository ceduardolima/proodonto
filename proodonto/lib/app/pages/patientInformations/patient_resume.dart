import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/shared/default_size.dart';

import 'patient_personal_info.dart';

class PatientResume extends StatefulWidget {
  const PatientResume(
      {super.key, required this.patient, required this.database});

  final ProodontoDatabase database;
  final Patient patient;

  @override
  State<PatientResume> createState() => _PatientResumeState();
}

class _PatientResumeState extends State<PatientResume> {
  bool enable = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    final Patient patient = widget.patient;
    return Padding(
      padding: const EdgeInsets.all(PaddingSize.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _EnableDisableVisibilityButton(
                text: 'Paciênte',
                visibility: visible,
                changeVisibility: () {
                  setState(() {
                    visible = !visible;
                  });
                },
              )),
          PatientInformationData(
              patient: patient,
              enable: enable,
              visibility: visible,
              database: widget.database)
        ],
      ),
    );
  }
}

class _EnableDisableVisibilityButton extends StatelessWidget {
  _EnableDisableVisibilityButton(
      {super.key,
      required this.visibility,
      required this.text,
      required this.changeVisibility});

  bool visibility = false;
  final Function changeVisibility;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => changeVisibility(),
      icon: visibility
          ? Image.asset(
              "assets/icons/minus.png",
              scale: 2.8,
            )
          : const Icon(Icons.add),
      label: Text(text),
    );
  }
}
