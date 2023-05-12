import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/shared/default_size.dart';

class SearchPatientHome extends StatelessWidget {
  const SearchPatientHome({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pesquisar paciênte"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingSize.medium, vertical: PaddingSize.small),
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.search), labelText: "CPF"),
              ),
              FutureBuilder<List<Patient>>(
                future: database.patientDao.getAll(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].name),
                            );
                          })
                      : Center(
                          child: Text("Vazio"),
                        );
                },
              ),
            ])));
  }
}

class _PatientItemList extends StatelessWidget {
  int color;

  _PatientItemList({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 100,
        alignment: Alignment.centerLeft,
        color: Colors.blue[color],
        child: Column(
          children: const [
            Text("CPF"),
            Text("Nome"),
            Text("N. prontuário"),
          ],
        ),
      ),
    );
  }
}
