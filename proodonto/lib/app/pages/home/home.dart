import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/pages/anamnesis/anamnesis_home.dart';
import 'package:proodonto/app/pages/exam/exam_home.dart';
import 'package:proodonto/app/pages/home/expandable_fab.dart';
import 'package:proodonto/app/pages/home/patient_item_list.dart';
import 'package:proodonto/app/pages/patientInformations/patient_informations_page.dart';
import 'package:proodonto/app/pages/triage/triage_home.dart';
import 'package:proodonto/app/shared/default_size.dart';

import '../../database/entity/exam.dart';
import '../../database/entity/triage.dart';
import '../patient/patient_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  void _changeToPatientHomePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PatientHomePage(database: database)));
  }

  void _changeToTriageHomePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TriageHome(
                  database: database,
                )));
  }

  void _changeToExamHomePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ExamHome(
                  database: database,
                )));
  }

  void _changeToAnamnesisHome(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AnamnesisHome(database: database)));
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalObjectKey<ExpandableFabState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MultiExpandableFab(
        children: [
          FloatingSubButton(
              title: "Paciêntes",
              navigate: () => _changeToPatientHomePage(context)),
          FloatingSubButton(
              title: "Triagem",
              navigate: () => _changeToTriageHomePage(context)),
          FloatingSubButton(
              title: "Exames", navigate: () => _changeToExamHomePage(context)),
          FloatingSubButton(
              title: "Aamnese",
              navigate: () => _changeToAnamnesisHome(context)),
        ],
      ),
      body: ConsultListView(
        database: database,
      ),
    );
  }
}

class ConsultListView extends StatelessWidget {
  const ConsultListView({super.key, required this.database});

  final ProodontoDatabase database;

  void _changeToPatientInformation(
      BuildContext context, Patient patient, Exam exam, Triage triage) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PatientInformationPage(
                  database: database,
                  patient: patient,
                  exam: exam,
                  triage: triage,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingSize.small,
        horizontal: PaddingSize.medium,
      ),
      child: FutureBuilder(
        future: database.patientDao.getAll(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: PatientItem(
                          patient: snapshot.data![index],
                          onTap: (patient) async {
                            Exam? exam =
                                await database.examDao.findByCPF(patient.cpf!);
                            Triage? triage = await database.triageDao
                                .findByPatientCPF(patient.cpf!);
                            if (context.mounted) {
                              _changeToPatientInformation(
                                context,
                                snapshot.data![index],
                                exam!,
                                triage!,
                              );
                            }
                          },
                        ));
                  })
              : const Center(child: Text("Vazia."));
        },
      ),
    );
  }
}

class FloatingSubButton extends StatelessWidget {
  const FloatingSubButton(
      {super.key, required this.title, required this.navigate});

  final String title;
  final Function() navigate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 120,
        height: 40,
        child: ElevatedButton(onPressed: () => navigate(), child: Text(title)));
  }
}
