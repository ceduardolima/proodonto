import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/anamnesis.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/pages/anamnesis/anamnesis_home.dart';
import 'package:proodonto/app/pages/exam/exam_home.dart';
import 'package:proodonto/app/pages/home/expandable_fab.dart';
import 'package:proodonto/app/pages/home/patient_item_list.dart';
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
  Widget customSearchBar = const Text("Proodonto");
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  String _cpf = "";
  static const _itemListVerticalPadding = 10.0;

  void _enableSearchBar() {
    customIcon = const Icon(Icons.cancel);
    customSearchBar = ListTile(
      title: TextField(
        controller: _controller,
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          setState(() => _cpf = value);
        },
        decoration: const InputDecoration(
          hintText: 'CPF...',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  void _disableSearchBar() {
    customIcon = const Icon(Icons.search);
    customSearchBar = const Text('Proodonto');
  }

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

  Widget _emptyListText() => const Center(
        child: Text(
          "Pesquise pelo CPF do seu paciênte",
          style: TextStyle(color: Colors.grey),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final key = GlobalObjectKey<ExpandableFabState>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: customSearchBar,
        actions: [
          IconButton(
            onPressed:() {
              showSearch(context: context, delegate: SearchPatient(widget.database));
              },
            icon: customIcon,
          )
        ],
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: PaddingSize.small,
          horizontal: PaddingSize.medium,
        ),
        child: FutureBuilder(
          future: widget.database.patientDao.getAll(),
          builder: (context, snapshot) {
            return (snapshot.hasData)
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: _itemListVerticalPadding,
                        ),
                        child: PatientItem(
                          patient: snapshot.data![index]!,
                          onTap: (patient) =>
                              _changeToPatientInformation(context, patient),
                        ),
                      );
                    },
                  )
                : _emptyListText();
          },
        ),
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
      child: ElevatedButton(
        onPressed: () => navigate(),
        child: Text(title),
      ),
    );
  }
}
