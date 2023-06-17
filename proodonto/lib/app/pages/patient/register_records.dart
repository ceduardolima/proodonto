import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import '../../database/entity/patient.dart';

class RegisterRecordsForm extends RegisterForm {
  RegisterRecordsForm({Key? key, required this.patient}) : super(key: key);
  Patient patient = Patient();
  final _formKey = GlobalKey<FormBuilderState>();

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
              initialValue: patient.advisor,
            ),
            DefaultFormField(
              name: "semester",
              label: "Período",
              initialValue: patient.semester,
              length: 6,
              inputType: TextInputType.number,
            ),
            DefaultFormField(
              name: "careUnit",
              label: "Unidade de atendimento",
              initialValue: patient.careUnit,
            ),
            DefaultFormField(
              name: "initialExam",
              label: "Exame inicial",
              initialValue: patient.initialExam,
            ),
          ],
        ));
  }

  @override
  bool validate() {
    return validateFields();
  }
  
  bool validateFields() {
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

  @override
  Patient getFields(Patient patient) {
    _formKey.currentState?.save();
    var fields = _formKey.currentState?.fields;
    patient.recordNumber = int.parse(fields!["recordNumber"]?.value);
    patient.advisor = fields["advisor"]?.value.toString().toLowerCase();
    patient.semester = fields["semester"]?.value;
    patient.careUnit = fields["careUnit"]?.value.toString().toLowerCase();
    patient.initialExam = fields["initialExam"]?.value.toString().toLowerCase();
    return patient;
  }
}
