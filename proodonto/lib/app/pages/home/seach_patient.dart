import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/home/patient_item_list.dart';

import '../../database/entity/anamnesis.dart';
import '../../database/entity/exam.dart';
import '../../database/entity/patient.dart';
import '../../database/entity/triage.dart';
import '../../shared/default_size.dart';
import '../patientInformations/patient_informations_page.dart';

class SearchPatient extends SearchDelegate {
  static const _itemListVerticalPadding = 10.0;
  final ProodontoDatabase _database;

  SearchPatient(this._database, {super.keyboardType = TextInputType.number, super.searchFieldLabel = "Digite o CPF..."}) {
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingSize.small,
        horizontal: PaddingSize.medium,
      ),
      child: FutureBuilder(
        future: _database.patientDao.findLikeCPF(_cleanQuery()),
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
    );
  }

  String _cleanQuery() {
    if (query.isEmpty) {
      return query;
    }
    return "${query.trim()}%";
  }

  void _changeToPatientInformation(
      BuildContext context, Patient patient) async {
    Exam? exam = await _database.examDao.findByCPF(patient.cpf!);
    Triage? triage = await _database.triageDao.findByPatientCPF(patient.cpf!);
    Anamnesis? anamnesis = await _database.anamnesisDao.findByCPF(patient.cpf!);
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientInformationPage(
            database: _database,
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
          "Paciênte não encontrado",
          style: TextStyle(color: Colors.grey),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text(
        "Pesquise pelo CPF do seu paciênte",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
