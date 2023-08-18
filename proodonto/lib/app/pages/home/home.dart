import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/anamnesis.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/pages/anamnesis/anamnesis_home.dart';
import 'package:proodonto/app/pages/exam/exam_home.dart';
import 'package:proodonto/app/pages/home/seach_patient.dart';
import 'package:proodonto/app/pages/patientInformations/patient_informations_page.dart';
import 'package:proodonto/app/pages/triage/triage_home.dart';
import 'package:proodonto/app/shared/default_size.dart';

import '../../database/entity/exam.dart';
import '../../database/entity/triage.dart';
import '../patient/patient_home.dart';

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

  void _changeToPatientInformation(
      BuildContext context, Patient patient) async {
    Exam? exam = await widget.database.examDao.findByCPF(patient.cpf!);
    Triage? triage =
        await widget.database.triageDao.findByPatientCPF(patient.cpf!);
    Anamnesis? anamnesis =
        await widget.database.anamnesisDao.findByCPF(patient.cpf!);
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _TabViewAppBar.build(
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
                _FormButton(
                  icon: Icons.people_alt,
                  onPressed: () {
                    _changeToPatientHomePage(context);
                  },
                  text: "Cadastro Paciênte",
                ),
                _FormButton(
                  imagePath: _triageIconPath,
                  onPressed: () {
                    _changeToTriageHomePage(context);
                  },
                  text: "Cadastro Triagem",
                ),
                _FormButton(
                  imagePath: _anamneseIconPath,
                  onPressed: () {
                    _changeToAnamnesisHome(context);
                  },
                  text: "Cadastro Anamnese",
                ),
                _FormButton(
                  imagePath: _examIconPath,
                  onPressed: () {
                    _changeToExamHomePage(context);
                  },
                  text: "Cadastro Exame Físico",
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}

class _TabViewAppBar {
  static const _height = 60.0;
  static const _elevation = 0.0;
  static const _title = "Proodonto";
  static const _fontSize = 20.0;
  static const String _userIconPath = "assets/icons/user.png";

  static PreferredSizeWidget build({
    required BuildContext context,
    required ProodontoDatabase database,
    required List<Widget> tabList,
  }) {
    return AppBar(
      elevation: _elevation,
      toolbarHeight: _height,
      title: const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          _title,
          style: TextStyle(fontSize: _fontSize),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Row(
            children: [
              IconButton.outlined(
                onPressed: () {
                  showSearch(context: context, delegate: SearchPatient(database));
                },
                icon: const Icon(Icons.search),
              ),
              IconButton.outlined(
                onPressed: () {},
                icon: Container(child: Image.asset(_userIconPath)),
              ),
            ],
          ),
        )
      ],
      bottom: TabBar(
        tabs: tabList,
      ),
    );
  }
}

class _FormButton extends StatelessWidget {
  _FormButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.imagePath});

  final String text;
  IconData? icon;
  String? imagePath;
  final Function onPressed;
  static const double _buttonSize = 50;
  static const double _buttonRadius = 50;
  static const double _iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(1)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => {onPressed()},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: _buttonSize,
                    height: _buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_buttonRadius),
                      color: Colors.blue,
                    ),
                    child: (icon != null)
                        ? Icon(
                            icon,
                            size: _iconSize,
                            color: Colors.white,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              imagePath!,
                            ),
                          ),
                  ),
                  Container(height: 20),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
