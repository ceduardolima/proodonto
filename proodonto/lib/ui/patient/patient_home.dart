import 'package:flutter/material.dart';
import '../../utils/default_size.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pacientes"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: PaddingSize.big),
        child: _PatientHomePageContent()
      ),
    );
  }
}

class _PatientHomePageContent extends StatelessWidget {
  const _PatientHomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(child: Text("Pesquisar"), onPressed: () => {},),
        ElevatedButton(child: Text("Cadastrar"), onPressed: () => {},),
      ],
    );
  }
}

