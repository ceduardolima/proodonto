import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';
import '../../../database/entity/patient.dart';

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
              required: true,
            ),
            DefaultFormField(
              name: "advisor",
              label: "Orientador",
              initialValue: patient.advisor,
            ),
            DefaultFormField(
              name: "semester",
              label: "Período",
              hint: "Ex: 05",
              initialValue: patient.semester,
              length: 2,
              inputType: TextInputType.number,
              required: true,
            ),
            DefaultDropdownButton(
              name: "careUnit",
              label: "Unidade de atendimento",
              initialValue: CareUnit.getNameList()[0],
              list: CareUnit.getNameList(),
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
  dynamic getFields(dynamic field) {
    _formKey.currentState?.save();
    var fields = _formKey.currentState?.fields;
    field.recordNumber = int.parse(fields!["recordNumber"]?.value);
    field.advisor = fields["advisor"]?.value.toString().toLowerCase();
    field.semester = fields["semester"]?.value;
    field.careUnit = fields["careUnit"]?.value.toString().toLowerCase();
    field.initialExam = fields["initialExam"]?.value.toString().toLowerCase();
    return field;
  }
}
