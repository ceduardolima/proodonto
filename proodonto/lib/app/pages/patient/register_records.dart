import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/patient/register_patient.dart';
import 'package:proodonto/app/repository/patient_repository.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/widget/buttons.dart';

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
                Map patientMap = getFields();
                _changeToPatientRegister(context, patientMap);
              },
              text: "Próximo",
            )
          ],
        ));
  }

  Map getFields() {
    var fields = _formKey.currentState?.fields;
    return {
      "recordNumber": fields!["recordNumber"]?.value,
      "advisor": fields["advisor"]?.value,
      "semester": fields["semester"]?.value,
      "careUnit": fields["careUnit"]?.value,
      "initialExam": fields["initialExam"]?.value
    };
  }

  void _changeToPatientRegister(BuildContext context, Map patientMap) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterPatientHome(
                  database: database,
                  patientMap: patientMap,
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
