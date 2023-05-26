import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/exam.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';
import 'package:proodonto/app/widget/buttons.dart';

import '../../shared/form_field_validation.dart';

class RegisterExamHome extends StatelessWidget {
  RegisterExamHome({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;
  final _formKey = GlobalKey<FormBuilderState>();
  final _exam = Exam();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Exame"),
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
                    name: "patientCPF", label: "CPF do paciênte", length: 11),
                DefaultDropdownButton(
                  name: "generalType",
                  label: "Tipo Geral",
                  list: GeneralType.getNameList(),
                  initialValue: GeneralType.getNameList()[0],
                ),
                DefaultFormField(name: "weight", label: "Peso"),
                DefaultFormField(name: "height", label: "altura"),
                DefaultFormField(name: "temperature", label: "Temperatura"),
                DefaultFormField(
                    name: "bloodPressure", label: "Pressão arterial"),
                DefaultFormField(name: "pulsation", label: "Pulsação"),
                DefaultFormField(name: "oximetry", label: "Oximetria"),
                DefaultFormField(
                    name: "othersObservations", label: "Outras observações"),
                DefaultDropdownButton(
                  name: "skinColor",
                  label: "Cor da pele",
                  list: SkinColor.getNameList(),
                  initialValue: SkinColor.getNameList()[0],
                ),
                DefaultFormField(
                    name: "skinColoring", label: "Coloração da pele"),
                DefaultFormField(name: "consistency", label: "Consistência"),
                DefaultFormField(name: "skinTexture", label: "Textura da pele"),
                DefaultFormField(name: "eyeColor", label: "Cor dos olhos"),
                DefaultFormField(name: "hairColor", label: "Cor dos cabelos"),
                DefaultDropdownButton(
                  name: "asymmetryType",
                  label: "Assimetria",
                  list: Asymmetry.getNameList(),
                  initialValue: Asymmetry.getNameList()[0],
                ),
                DefaultDropdownButton(
                  name: "surfaceType",
                  label: "Tipo de superficie",
                  list: Surface.getNameList(),
                  initialValue: Surface.getNameList()[0],
                ),
                DefaultDropdownButton(
                  name: "mobilityType",
                  label: "Mobilidade",
                  list: Mobility.getNameList(),
                  initialValue: Mobility.getNameList()[0],
                ),
                DefaultDropdownButton(
                  name: "sensibilityType",
                  label: "Sensibilidade",
                  list: Sensibility.getNameList(),
                  initialValue: Sensibility.getNameList()[0],
                ),
                DefaultDropdownButton(
                  name: "lipsType",
                  label: "Tipo de lábio",
                  list: Lip.getNameList(),
                  initialValue: Lip.getNameList()[0],
                ),
                DefaultDropdownButton(
                    name: "tongueType",
                    label: "Tipo de língua",
                    list: Tongue.getNameList(),
                    initialValue: Tongue.getNameList()[0]),
                DefaultFormField(name: "buccalMucosa", label: "Mucosa jugal"),
                DefaultFormField(name: "gum", label: "Gengiva"),
                DefaultFormField(
                    name: "alveolarRidge", label: "Rebordo alveolar"),
                DefaultFormField(
                    name: "retromolarTrigone", label: "Trigono retromolar"),
                DefaultFormField(name: "mouthFloor", label: "Assoalho bocal"),
                DefaultFormField(name: "palateModel", label: "Palato moledura"),
                DefaultFormField(
                    name: "tonsilPillars", label: "Pilares amígdala"),
                DefaultFormField(
                    name: "variationNormality", label: "Variação normalidade"),
                DefaultFormField(
                    name: "injuryPresence", label: "Presença de lesão"),
                DefaultFormField(
                    name: "injuryDescription", label: "Descrição da lesão"),
                DefaultFormField(
                    name: "diagnosticHypothesis",
                    label: "Hipótese diagnóstica"),
                DefaultFormField(
                    name: "complementaryExam", label: "Exames Complementares"),
                DefaultFormField(
                    name: "examResult", label: "Resultado do exame"),
                DefaultFormField(
                    name: "definitiveDiagnosis",
                    label: "Diagnóstico definitivo"),
                DefaultFormField(name: "conduct", label: "conduta"),
                DefaultButton(
                  text: "Registrar",
                  onPressed: () => _finishRegister(context),
                )
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
    await database.examDao.insert(_exam);
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
    _formKey.currentState!.save();
    final fields = _formKey.currentState!.fields;
    _exam.patientCPF = fields["patientCPF"]!.value;
    _exam.generalType = GeneralType.values[
        GeneralType.getNameList().indexOf(fields["generalType"]!.value)];
    _exam.weight = fields["weight"]!.value;
    _exam.height = fields["height"]!.value;
    _exam.temperature = fields["temperature"]!.value;
    _exam.bloodPressure = fields["bloodPressure"]!.value;
    _exam.pulsation = fields["pulsation"]!.value;
    _exam.oximetry = fields["oximetry"]!.value;
    _exam.othersObservations = fields["othersObservations"]!.value;
    _exam.skinColor = SkinColor
        .values[SkinColor.getNameList().indexOf(fields["skinColor"]!.value)];
    _exam.skinColoring = fields["skinColoring"]!.value;
    _exam.consistency = fields["consistency"]!.value;
    _exam.skinTexture = fields["skinTexture"]!.value;
    _exam.eyeColor = fields["eyeColor"]!.value;
    _exam.hairColor = fields["hairColor"]!.value;
    _exam.asymmetryType = Asymmetry.values[
        Asymmetry.getNameList().indexOf(fields["asymmetryType"]!.value)];
    _exam.surfaceType = Surface
        .values[Surface.getNameList().indexOf(fields["surfaceType"]!.value)];
    _exam.mobilityType = Mobility
        .values[Mobility.getNameList().indexOf(fields["mobilityType"]!.value)];
    _exam.sensibilityType = Sensibility.values[
        Sensibility.getNameList().indexOf(fields["sensibilityType"]!.value)];
    _exam.lipsType =
        Lip.values[Lip.getNameList().indexOf(fields["lipsType"]!.value)];
    _exam.tongueType = Tongue
        .values[Tongue.getNameList().indexOf(fields["tongueType"]!.value)];
    _exam.buccalMucosa = fields["buccalMucosa"]!.value;
    _exam.gum = fields["gum"]!.value;
    _exam.alveolarRidge = fields["alveolarRidge"]!.value;
    _exam.retromolarTrigone = fields["retromolarTrigone"]!.value;
    _exam.mouthFloor = fields["mouthFloor"]!.value;
    _exam.palateModel = fields["palateModel"]!.value;
    _exam.tonsilPillars = fields["tonsilPillars"]!.value;
    _exam.variationNormality = fields["variationNormality"]!.value;
    _exam.injuryPresence = fields["injuryPresence"]!.value;
    _exam.injuryDescription = fields["injuryDescription"]!.value;
    _exam.definitiveDiagnosis = fields["definitiveDiagnosis"]!.value;
    _exam.diagnosticHypothesis = fields["diagnosticHypothesis"]!.value;
    _exam.examResult = fields["examResult"]!.value;
    _exam.complementaryExams = fields["complementaryExam"]!.value;
    _exam.definitiveDiagnosis = fields["definitiveDiagnosis"]!.value;
    _exam.conduct = fields["conduct"]!.value;
  }
}
