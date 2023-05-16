import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/enum_types.dart';

class RegisterPatientResponsible extends StatelessWidget {
  const RegisterPatientResponsible(
      {Key? key, required this.database, required this.patient})
      : super(key: key);
  final ProodontoDatabase database;
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar responsável"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
        child: SingleChildScrollView(
          child: _PacientResponsibleForm(
            database: database,
            patient: patient,
          ),
        ),
      ),
    );
  }
}

class _PacientResponsibleForm extends StatelessWidget {
  _PacientResponsibleForm(
      {Key? key, required this.database, required this.patient})
      : super(key: key) {
    finish.addListener(() {
      if (finish.value) {

      }
    });
  }
  final _formKey = GlobalKey<FormBuilderState>();
  final ProodontoDatabase database;
  final Patient patient;
  final ValueNotifier<bool> finish = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          const _RegisterPatientResponsibleTextField(
              name: "responsibleName", label: "Nome do responsável"),
          const _RegisterPatientResponsibleTextField(
              name: "responsibleAddress", label: "Endereço do responsável"),
          const _RegisterPatientResponsibleTextField(
            name: "responsibleRG",
            label: "RG do responsável",
            inputType: TextInputType.number,
          ),
          const _RegisterPatientResponsibleTextField(
              name: "responsibleIssuingAgency",
              label: "Orgão expedidor do responsável"),
          const _RegisterPatientResponsibleTextField(
              name: "parentalRelationship", label: "Relação parental"),
          const _RegisterPatientResponsibleTextField(
            name: "responsibleNumber",
            label: "Telefone do responsável",
            inputType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              _addFieldToPatientMap();
              _insertPatient(patient);
              _finishRegister(context);
            },
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text("Próximo"),
          ),
        ],
      ),
    );
  }

  void _addFieldToPatientMap() {
    final fields = _formKey.currentState?.fields;
    patient.responsibleName = fields!["responsibleName"]?.value;
    patient.responsibleAddress = fields["responsibleAddress"]?.value;
    patient.responsibleRG = fields["responsibleRG"]?.value;
    patient.responsibleIssuingAgency =
        fields["responsibleIssuingAgency"]?.value;
    patient.parentalRelationship = fields["parentalRelationship"]?.value;
    patient.responsiblePhoneNumber = fields["responsibleNumber"]?.value;
  }
  void _insertPatient(Patient patient) async {
    await database.patientDao.insert(patient);
  }
  void _finishRegister(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage(
                  database: database,
                )),
            (route) => false);
  }
}

class _RegisterPatientResponsibleTextField extends StatelessWidget {
  const _RegisterPatientResponsibleTextField({required this.name,
    required this.label,
    this.hint,
    Key? key,
    this.inputType})
      : super(key: key);

  final String name;
  final String? hint;
  final String label;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderTextField(
        name: name,
        keyboardType: inputType,
        decoration: InputDecoration(labelText: label, hintText: hint),
      ),
    );
  }
}
