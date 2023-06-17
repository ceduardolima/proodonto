import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/triage.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_radio_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/dialogs.dart';
import 'package:proodonto/app/shared/form_field_validation.dart';
import 'package:proodonto/app/widget/buttons.dart';

class RegisterTriageHome extends StatelessWidget {
  RegisterTriageHome({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;
  final _triage = Triage();
  final _formKey = GlobalKey<FormBuilderState>();

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
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                DefaultFormField(
                  name: "operatorName",
                  label: "CPF do operador",
                ),
                DefaultFormField(
                  name: "patientName",
                  label: "CPF do paciênte",
                ),
                DefaultFormField(
                  name: "recordNumber",
                  label: "Pronuário",
                  inputType: TextInputType.number,
                ),
                DefaultFormField(
                    name: "reasonForConsultation", label: "Motivo da consulta"),
                DefaultFormField(name: "kinship", label: "Parentesco"),
                DefaultFormField(name: "testType", label: "tipo do teste"),
                DefaultRadioButton(
                    name: "hasCovid", label: "Confirmação de covid"),
                DefaultRadioButton(name: "hasFever", label: "Febre"),
                DefaultRadioButton(name: "hasTiredness", label: "Cansaço"),
                DefaultRadioButton(
                    name: "hasDifficultyToBreathing",
                    label: "Dificuldade Para respirar"),
                DefaultRadioButton(name: "hasCough", label: "Tosse"),
                DefaultRadioButton(
                    name: "hasLossOfSmell", label: "Perda de olfato"),
                DefaultRadioButton(
                    name: "hasLossOfTaste", label: "Perda do paladar"),
                DefaultRadioButton(
                    name: "hasSoreThroat", label: "Dor na garganta"),
                DefaultRadioButton(name: "hasHeadache", label: "Dor de cabeça"),
                DefaultRadioButton(name: "hasDiarrhea", label: "Diarreia"),
                DefaultFormField(name: "oximetry", label: "Oximatria"),
                DefaultFormField(
                    name: "heartRate", label: "Frequência cardíaca"),
                DefaultFormField(name: "temperature", label: "Temperatura"),
                DefaultButton(
                    text: "Cadastrar Triagem",
                    onPressed: () => _finishRegister(context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _finishRegister(BuildContext context) async {
    _formKey.currentState?.save();
    bool isValid = validateItems(_formKey);
    if (isValid) {
      _registerTriage(context);
      if (context.mounted) {
        _showSnackBar(context);
        _backToHomePage(context);
      }
    }
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Triage cadastrada")));
  }

  void _registerTriage(BuildContext context) async {
    _getFields();
    await database.triageDao.insert(_triage);
  }

  void _backToHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  database: database,
                )),
        (route) => false);
  }

  void _getFields() {
    final fields = _formKey.currentState!.fields;
    _triage.hasCovid = fields["hasCovid"]!.value;
    _triage.testType = fields["testType"]!.value;
    _triage.kinship = fields["kinship"]!.value;
    _triage.hasFever = fields["hasFever"]!.value;
    _triage.hasTiredness = fields["hasTiredness"]!.value;
    _triage.hasDifficultyToBreathing =
        fields["hasDifficultyToBreathing"]!.value;
    _triage.hasCough = fields["hasCough"]!.value;
    _triage.hasLossOfSmell = fields["hasLossOfSmell"]!.value;
    _triage.hasLossOfTaste = fields["hasLossOfTaste"]!.value;
    _triage.hasSoreThroat = fields["hasSoreThroat"]!.value;
    _triage.hasHeadache = fields["hasHeadache"]!.value;
    _triage.hasDiarrhea = fields["hasDiarrhea"]!.value;
    _triage.heartRate = fields["heartRate"]!.value;
    _triage.oximetry = fields["oximetry"]!.value;
    _triage.temperature = fields["temperature"]!.value;
  }
}
