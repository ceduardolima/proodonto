import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/database/entity/triage.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';

class TriageBasicInfoForm extends RegisterForm {
  TriageBasicInfoForm({Key? key, required this.triage}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final Triage triage;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          DefaultFormField(
            name: "operatorName",
            label: "CPF do operador",
            initialValue: triage.operatorName,
          ),
          DefaultFormField(
            name: "recordNumber",
            label: "Número do prontuário",
            inputType: TextInputType.number,
            initialValue: triage.recordNumber.toString(),
          ),
          DefaultFormField(
            name: "patientName",
            label: "Nome do paciênte",
            initialValue: triage.patientName,
          ),
          DefaultFormField(
            name: "patientCPF",
            label: "CPF do paciênte",
            initialValue: triage.patientCPF,
          ),
          DefaultFormField(
            name: "reasonForConsultation",
            label: "Razão da consulta",
            initialValue: triage.reasonForConsultation,
          )
        ],
      ),
    );
  }

  @override
  dynamic getFields(dynamic field) {
    final fields = _formKey.currentState!.fields;
    triage.patientCPF = fields["patientCPF"]!.value;
    triage.operatorName = fields["operatorName"]!.value;
    triage.patientName = fields["patientName"]!.value;
    triage.recordNumber = int.tryParse(fields["recordNumber"]!.value);
    triage.reasonForConsultation = fields["reasonForConsultation"]!.value;
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
}
