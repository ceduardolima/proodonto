import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/patient/register_patient_informations.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/widget/buttons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
  final patient = Patient();
  final _formKey = GlobalKey<FormBuilderState>();
  String? errorMessenger;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DefaultFormField(
              name: "recordNumber",
              label: "Número do prontuário",
              inputType: TextInputType.number,
            ),
            DefaultFormField(
              name: "advisor",
              label: "Orientador",
            ),
            DefaultFormField(
              name: "semester",
              label: "Período",
              inputType: TextInputType.number,
            ),
            DefaultFormField(
              name: "careUnit",
              label: "Unidade de atendimento",
            ),
            DefaultFormField(
              name: "initialExam",
              label: "Exame inicial",
            ),
            DefaultButton(
              onPressed: () {
                bool isValid = _validateItems();
                if (isValid) {
                  getFields();
                  _changeToPatientRegister(context, patient);
                }
              },
              text: "Próximo",
            )
          ],
        ));
  }

  bool _validateItems() {
    final values = _formKey.currentState?.fields.values.toList();
    bool isValid = true;
    values?.forEach((element) {
      element.validate();
      if (!element.isValid) {
        isValid = false;
      }
    });
    return isValid;
  }

  void getFields() {
    _formKey.currentState?.save();
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
