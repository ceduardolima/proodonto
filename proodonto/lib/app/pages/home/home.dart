import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/pages/anamnesis/anamnesis_home.dart';
import 'package:proodonto/app/pages/anamnesis/register_anamnesis.dart';
import 'package:proodonto/app/pages/exam/exam_home.dart';
import 'package:proodonto/app/pages/home/patient_item_list.dart';
import 'package:proodonto/app/pages/patient/register_records.dart';
import 'package:proodonto/app/pages/triage/register_triage.dart';
import 'package:proodonto/app/pages/triage/triage_home.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'dart:math' as math;

import '../patient/patient_home.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.database}) : super(key: key);
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
            builder: (context) => TriageHome(database: database,)));
  }

  void _changeToExamHomePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ExamHome(database: database,)));
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
        title: Text("Home"),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: key,
        child: Icon(Icons.add),
        type: ExpandableFabType.up,
        distance: 50.0,
        expandedFabSize: ExpandableFabSize.regular,
        childrenOffset: Offset(4, 30),
        expandedFabShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        collapsedFabShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        overlayStyle: ExpandableFabOverlayStyle(blur: 2),
        children: [
          SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                  onPressed: () => _changeToPatientHomePage(context),
                  child: Text("Paciêntes"))),
          SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                  onPressed: () => _changeToTriageHomePage(context),
                  child: Text("Triagem"))),
          SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                  onPressed: () => _changeToExamHomePage(context),
                  child: Text("Exames"))),
          SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                  onPressed: () => _changeToAnamnesisHome(context),
                  child: Text("Anamnese"))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingSize.small),
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
                              onTap: (patient) {
                                debugPrint(patient.name.toString());
                            },
                            ));
                      })
                  : const Center(child: Text("Vazia."));
            },
          ),
        ),
    );
  }
}
