import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../utils/default_size.dart';

class RegisterTriageHome extends StatelessWidget {
  const RegisterTriageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Triagem"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: PaddingSize.small, horizontal: PaddingSize.medium),
          child: Column(
            children: const [
              _TriageFormField(name: "operatorName", label: "Nome do operador"),
              _TriageFormField(name: "patientName", label: "Nome do paciênte"),
              _TriageFormField(name: "recordNumber", label: "Pronuário", inputType: TextInputType.number,),
              _TriageFormField(name: "reasonForConsultation", label: "Motivo da consulta",),
              _TriageFormField(name: "hasCovid", label: "Confirmação de covid"),
              _TriageFormField(name: "testType", label: "tipo do teste"),
              _TriageFormField(name: "kinship", label: "Parentesco"),
              _TriageFormField(name: "hasFever", label: "Febre"),
              _TriageFormField(name: "hasTiredness", label: "Cansaço"),
              _TriageFormField(name: "hasDifficultyBreathing", label: "Dificuldade Para respirar"),
              _TriageFormField(name: "hasLossOfSmell", label: "Perda de olfato"),
              _TriageFormField(name: "hasLossOfSmell", label: "Perda de olfato"),
              _TriageFormField(name: "hasLossOfTaste", label: "Perda do paladar"),
              _TriageFormField(name: "hasSoreThroat", label: "Dor na garganta"),
              _TriageFormField(name: "hasHeadache", label: "Dor de cabeça"),
              _TriageFormField(name: "hasDiarrhea", label: "Diarreia"),
              _TriageFormField(name: "oximetria", label: "Oximatria"),
              _TriageFormField(name: "heartRate", label: "Frequência cardíaca"),
              _TriageFormField(name: "temperature", label: "Temperatura"),
            ],
          ),
        ),
      ),
    );
  }
}

class _TriageFormField extends StatelessWidget {
  const _TriageFormField({required this.name,
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
