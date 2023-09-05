import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/anamnesis/anamnesis_home.dart';
import 'package:proodonto/app/pages/exam/exam_home.dart';
import 'package:proodonto/app/pages/home/patient_tab.dart';
import 'package:proodonto/app/pages/home/tab_view_app_bar.dart';
import 'package:proodonto/app/pages/triage/triage_home.dart';
import 'package:proodonto/app/shared/default_size.dart';

import '../patient/patient_home.dart';
import 'form_buttom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon customIcon = const Icon(Icons.search);
  final String _triageIconPath = "assets/icons/stethoscope.png";
  final String _anamneseIconPath = "assets/icons/form.png";
  final String _examIconPath = "assets/icons/examination.png";


  void _changeToPatientHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientHomePage(database: widget.database),
      ),
    );
  }

  void _changeToTriageHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TriageHome(
          database: widget.database,
        ),
      ),
    );
  }

  void _changeToExamHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExamHome(
          database: widget.database,
        ),
      ),
    );
  }

  void _changeToAnamnesisHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnamnesisHome(database: widget.database),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabViewAppBar.build(
          context: context,
          database: widget.database,
          tabList: [
            const Tab(text: "Fomulários"),
            const Tab(text: "Paciêntes"),
          ],
        ),
        body: TabBarView(
          children: [
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              padding: const EdgeInsets.symmetric(
                  vertical: PaddingSize.medium, horizontal: 2.0),
              children: [
                FormButton(
                  icon: Icons.people_alt,
                  onPressed: () {
                    _changeToPatientHomePage(context);
                  },
                  text: "Cadastro Paciente",
                ),
                FormButton(
                  imagePath: _triageIconPath,
                  onPressed: () {
                    _changeToTriageHomePage(context);
                  },
                  text: "Cadastro Triagem",
                ),
                FormButton(
                  imagePath: _anamneseIconPath,
                  onPressed: () {
                    _changeToAnamnesisHome(context);
                  },
                  text: "Cadastro Anamnese",
                ),
                FormButton(
                  imagePath: _examIconPath,
                  onPressed: () {
                    _changeToExamHomePage(context);
                  },
                  text: "Cadastro Exame Físico",
                ),
              ],
            ),
            PatientTab(database: widget.database)
          ],
        ),
      ),
    );
  }
}
