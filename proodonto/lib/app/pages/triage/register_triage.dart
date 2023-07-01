import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/entity/triage.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_radio_form_field.dart';

class RegisterTriageForm extends RegisterForm {
  RegisterTriageForm({Key? key, required this.triage}) : super(key: key);
  final Triage triage;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            DefaultFormField(name: "kinship", label: "Parentesco"),
            DefaultRadioButton(name: "hasFever", label: "Febre"),
            DefaultRadioButton(name: "hasCovid", label: "Confirmação de covid"),
            DefaultFormField(name: "testType", label: "tipo do teste"),
            DefaultRadioButton(name: "hasTiredness", label: "Cansaço"),
            DefaultRadioButton(
                name: "hasDifficultyToBreathing",
                label: "Dificuldade Para respirar"),
            DefaultRadioButton(name: "hasCough", label: "Tosse"),
            DefaultRadioButton(
                name: "hasLossOfSmell", label: "Perda de olfato"),
            DefaultRadioButton(
                name: "hasLossOfTaste", label: "Perda do paladar"),
            DefaultRadioButton(name: "hasSoreThroat", label: "Dor na garganta"),
            DefaultRadioButton(name: "hasHeadache", label: "Dor de cabeça"),
            DefaultRadioButton(name: "hasDiarrhea", label: "Diarreia"),
            DefaultFormField(name: "oximetry", label: "Oximatria"),
            DefaultFormField(name: "heartRate", label: "Frequência cardíaca"),
            DefaultFormField(
              name: "temperature",
              label: "Temperatura",
              suffixText: "ºC",
            ),
          ],
        ));
  }

  @override
  getFields(field) {
    final fields = _formKey.currentState!.fields;
    triage.hasCovid = fields["hasCovid"]!.value;
    triage.testType = fields["testType"]!.value;
    triage.kinship = fields["kinship"]!.value;
    triage.hasFever = fields["hasFever"]!.value;
    triage.hasTiredness = fields["hasTiredness"]!.value;
    triage.hasDifficultyToBreathing = fields["hasDifficultyToBreathing"]!.value;
    triage.hasCough = fields["hasCough"]!.value;
    triage.hasLossOfSmell = fields["hasLossOfSmell"]!.value;
    triage.hasLossOfTaste = fields["hasLossOfTaste"]!.value;
    triage.hasSoreThroat = fields["hasSoreThroat"]!.value;
    triage.hasHeadache = fields["hasHeadache"]!.value;
    triage.hasDiarrhea = fields["hasDiarrhea"]!.value;
    triage.heartRate = fields["heartRate"]!.value;
    triage.oximetry = fields["oximetry"]!.value;
    triage.temperature = fields["temperature"]!.value;
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
