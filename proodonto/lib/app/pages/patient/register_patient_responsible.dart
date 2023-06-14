import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:proodonto/app/interfaces/patient_form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';

class PatientResponsibleForm extends PatientForm {
  PatientResponsibleForm({super.key, required this.patient});

  final _formKey = GlobalKey<FormBuilderState>();
  Patient patient = Patient();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          DefaultFormField(
            name: "responsibleName",
            label: "Nome do responsável",
            initialValue: patient.responsibleName,
          ),
          DefaultFormField(
            name: "responsibleAddress",
            label: "Endereço do responsável",
            initialValue: patient.responsibleAddress,
          ),
          DefaultFormField(
            name: "responsibleRG",
            label: "RG do responsável",
            inputType: TextInputType.number,
            initialValue: patient.responsibleRG,
          ),
          DefaultFormField(
            name: "responsibleIssuingAgency",
            label: "Orgão expedidor do responsável",
            initialValue: patient.responsibleIssuingAgency,
          ),
          DefaultFormField(
            name: "parentalRelationship",
            label: "Relação parental",
            initialValue: patient.parentalRelationship,
          ),
          DefaultFormField(
            name: "responsibleNumber",
            label: "Telefone do responsável",
            initialValue: patient.responsiblePhoneNumber,
            inputType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  @override
  bool validate() {
    bool isValid = _validateItems();
    return isValid;
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

  @override
  Patient getFields(Patient patient) {
    final fields = _formKey.currentState?.fields;
    patient.responsibleName = fields!["responsibleName"]?.value;
    patient.responsibleAddress = fields["responsibleAddress"]?.value;
    patient.responsibleRG = fields["responsibleRG"]?.value;
    patient.responsibleIssuingAgency =
        fields["responsibleIssuingAgency"]?.value;
    patient.parentalRelationship = fields["parentalRelationship"]?.value;
    patient.responsiblePhoneNumber = fields["responsibleNumber"]?.value;
    return patient;
  }
}
