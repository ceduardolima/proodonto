import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/triage.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_radio_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';


class RegisterTriageHome extends StatelessWidget {
  RegisterTriageHome({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;
  final _triage = Triage();
  
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
            children: [
              DefaultFormField(name: "operatorCPF", label: "CPF do operador", inputType: TextInputType.number, length: 11,),
              DefaultFormField(name: "patientCPF", label: "CPF do paciênte", inputType: TextInputType.number , length: 11,),
              DefaultFormField(name: "recordNumber", label: "Pronuário", inputType: TextInputType.number,),
              DefaultFormField(name: "reasonForConsultation", label: "Motivo da consulta"),
              DefaultRadioButton(name: "hasCovid", label: "Confirmação de covid"),
              DefaultRadioButton(name: "testType", label: "tipo do teste"),
              DefaultRadioButton(name: "kinship", label: "Parentesco"),
              DefaultRadioButton(name: "hasFever", label: "Febre"),
              DefaultRadioButton(name: "hasTiredness", label: "Cansaço"),
              DefaultRadioButton(name: "hasDifficultyBreathing", label: "Dificuldade Para respirar"),
              DefaultRadioButton(name: "hasCough", label: "Tosse"),
              DefaultRadioButton(name: "hasLossOfSmell", label: "Perda de olfato"),
              DefaultRadioButton(name: "hasLossOfTaste", label: "Perda do paladar"),
              DefaultRadioButton(name: "hasSoreThroat", label: "Dor na garganta"),
              DefaultRadioButton(name: "hasHeadache", label: "Dor de cabeça"),
              DefaultRadioButton(name: "hasDiarrhea", label: "Diarreia"),
              DefaultRadioButton(name: "oximetria", label: "Oximatria"),
              DefaultRadioButton(name: "heartRate", label: "Frequência cardíaca"),
              DefaultRadioButton(name: "temperature", label: "Temperatura"),
            ],
          ),
        ),
      ),
    );
  }
}

