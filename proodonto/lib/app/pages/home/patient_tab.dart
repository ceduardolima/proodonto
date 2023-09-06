import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';

import '../../database/entity/anamnesis.dart';
import '../../database/entity/exam.dart';
import '../../database/entity/patient.dart';
import '../../database/entity/triage.dart';
import '../../shared/default_size.dart';
import '../../shared/patient_list_view.dart';
import '../patientInformations/patient_informations_page.dart';

class PatientTab extends StatefulWidget {
  const PatientTab({super.key, required this.database});

  final ProodontoDatabase database;

  @override
  State<PatientTab> createState() => _PatientTabState();
}

class _PatientTabState extends State<PatientTab> {
  late Future<List<Patient?>> _patientList;

  @override
  void initState() {
    super.initState();
    _patientList = widget.database.patientDao.getFavoritePatients();
  }

  void _changeToPatientInformation(
      BuildContext context, Patient patient) async {
    Exam? exam = await widget.database.examDao.findByRecordNumber(patient.recordNumber!);
    Triage? triage =
        await widget.database.triageDao.findByRecordNumber(patient.recordNumber!);
    Anamnesis? anamnesis =
        await widget.database.anamnesisDao.findByRecordNumber(patient.recordNumber!);
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientInformationPage(
            database: widget.database,
            patient: patient,
            exam: exam,
            triage: triage,
            anamnesis: anamnesis,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingSize.small,
        horizontal: PaddingSize.medium,
      ),
      child: RefreshIndicator(
        onRefresh: () async => setState(
          () => _patientList = widget.database.patientDao.getFavoritePatients()),
        child: FutureBuilder(
          future: _patientList,
          builder: (context, snapshot) {
            return (snapshot.hasData && snapshot.data!.isNotEmpty)
                ? PatientListView(
                    database: widget.database,
                    patientList: snapshot.data!,
                    onItemTap: (patient) {
                      _changeToPatientInformation(context, patient);
                    },
                    onFavButtonTap: () => setState(() {
                      _patientList =
                          widget.database.patientDao.getFavoritePatients();
                    }),
                  )
                : const Center(child: Text("Vazio"));
          },
        ),
      ),
    );
  }
}
