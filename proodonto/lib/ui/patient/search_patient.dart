import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../utils/default_size.dart';

class SearchPatientHome extends StatelessWidget {
  const SearchPatientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesquisar paciênte"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.medium, vertical: PaddingSize.small),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.search), labelText: "CPF"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: PaddingSize.medium),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
                children: [
                  _PatientItemList(color: 600),
                  _PatientItemList(color: 500),
                  _PatientItemList(color: 400),
                  _PatientItemList(color: 300),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
