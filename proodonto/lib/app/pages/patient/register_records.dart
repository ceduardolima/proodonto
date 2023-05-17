import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/patient/register_patient_informations.dart';
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

class _RegisterRecordsForm extends StatefulWidget {
  _RegisterRecordsForm({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;
  final patient = Patient();

  @override
  State<_RegisterRecordsForm> createState() =>
      _RegisterRecordsFormState(database: database);
}

class _RegisterRecordsFormState extends State<_RegisterRecordsForm> {
  _RegisterRecordsFormState({required this.database});

  final ProodontoDatabase database;
  final _formKey = GlobalKey<FormBuilderState>();
  final patient = Patient();
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
            _RecordFormField(
              name: "recordNumber",
              label: "Número do prontuário",
              inputType: TextInputType.number,
            ),
            _RecordFormField(
              name: "advisor",
              label: "Orientador",
            ),
            _RecordFormField(
              name: "semester",
              label: "Período",
              inputType: TextInputType.number,
            ),
            _RecordFormField(
              name: "careUnit",
              label: "Unidade de atendimento",
            ),
            _RecordFormField(
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

class _RecordFormField extends StatelessWidget {
  _RecordFormField(
      {required this.name,
      required this.label,
      this.hint,
      Key? key,
      this.inputType,
      this.maxLength,
      this.errorMessenger})
      : super(key: key);

  final String name;
  final String? hint;
  final String label;
  final int? maxLength;
  final TextInputType? inputType;
  String? errorMessenger;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderTextField(
        name: name,
        keyboardType: inputType,
        decoration: InputDecoration(
            labelText: label, hintText: hint,),
        maxLines: 1,
        maxLength: maxLength,
        validator: (value) => _validate(value),
      ),
    );
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessenger ?? "Campo obrigatório";
    }
    return null;
  }
}
