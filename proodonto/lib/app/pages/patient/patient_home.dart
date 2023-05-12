import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/patient/register_records.dart';
import 'package:proodonto/app/pages/patient/search_patient.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/shared/enum_types.dart';

import '../../shared/default_size.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pacientes"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: PaddingSize.big),
          child: _PatientHomePageContent(database: database)),
    );
  }
}

class _PatientHomePageContent extends StatelessWidget {
  const _PatientHomePageContent({Key? key, required this.database})
      : super(key: key);
  final ProodontoDatabase database;

  void _changeToRegisterPatient(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterRecordsHome(database: database)));
  }

  void _changeToSearchPatient(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPatientHome(database: database)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          child: Text("Pesquisar"),
          onPressed: () => _changeToSearchPatient(context),
        ),
        ElevatedButton(
          child: Text("Cadastrar"),
          onPressed: () => {
            /*database.patientDao.insert(Patient(
                recordNumber: 1111,
                advisor: "cadu",
                semester: "1",
                careUnit: "1",
                profession: "1",
                workAddress: "1",
                email: "1",
                initialExam: "1",
                responsibleName: "1",
                responsibleRG: "1",
                responsibleIssuingAgency: "1",
                parentalRelationship: "1",
                responsiblePhoneNumber: "1",
                name: "1",
                birthday: "1",
                sex: Sex.Male,
                cpf: "1",
                rg: "1",
                issuingAgency: "1",
                cep: "1",
                address:"1",
                neighborhood: "1",
                addressComplement: "1",
                skinColor: SkinColor.branca,
                fixNumber: "1",
                phone: "1",
                placeOfBirth: "1",
                nationality: "1",
                maritalStatus: MaritalStatus.casado))
          
             */
            _changeToRegisterPatient(context)
          },
        ),
      ],
    );
  }
}
