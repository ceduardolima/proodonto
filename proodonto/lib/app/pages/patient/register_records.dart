import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/patient/register_patient_informations.dart';
import 'package:proodonto/app/repository/patient_repository.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/widget/buttons.dart';

import '../../database/entity/patient.dart';

class RegisterRecordsHome extends StatelessWidget {
  const RegisterRecordsHome({Key? key, required this.database})
      : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar paciente"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _RegisterRecordsForm(database: database),
              ],
            ),
          ),
        ));
  }
}

class _RegisterRecordsForm extends StatelessWidget {
  _RegisterRecordsForm({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;
  final _formKey = GlobalKey<FormBuilderState>();
  final patient = Patient();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _RecordFormField(
              name: "recordNumber",
              label: "Número do prontuário",
              inputType: TextInputType.number,
            ),
            const _RecordFormField(name: "advisor", label: "Orientador"),
            const _RecordFormField(
              name: "semester",
              label: "Período",
              inputType: TextInputType.number,
            ),
            const _RecordFormField(
                name: "careUnit", label: "Unidade de atendimento"),
            const _RecordFormField(name: "initialExam", label: "Exame inicial"),
            DefaultButton(
              onPressed: () {
                getFields();
                _changeToPatientRegister(context, patient);
              },
              text: "Próximo",
            )
          ],
        ));
  }

  void getFields() {
    var fields = _formKey.currentState?.fields;
      patient.recordNumber = int.parse(fields!["recordNumber"]?.value);
      patient.advisor = fields["advisor"]?.value;
      patient.semester = fields["semester"]?.value;
      patient.careUnit = fields["careUnit"]?.value;
      patient.initialExam = fields["initialExam"]?.value;
  }

  void _changeToPatientRegister(BuildContext context, Patient patient) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterPatientInformationHome(
                  database: database,
                  patient: patient,
                )));
  }
}

class _RecordFormField extends StatelessWidget {
  const _RecordFormField(
      {required this.name,
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
