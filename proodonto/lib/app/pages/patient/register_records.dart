import 'package:flutter/material.dart';
import 'package:proodonto/ui/patient/register_patient.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/widget/buttons.dart';
import '../../../utils/default_size.dart';

class RegisterRecordsHome extends StatelessWidget {
  const RegisterRecordsHome({Key? key}) : super(key: key);

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
                _RegisterRecordsForm(),
              ],
            ),
          ),
        ));
  }
}

class _RegisterRecordsForm extends StatelessWidget {
  _RegisterRecordsForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  void _changeToPatientRegister(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterPatientHome()));
  }

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
              onPressed: () => _changeToPatientRegister(context),
              text: "Próximo",
            )
          ],
        ));
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
