import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/entity/exam.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';

class ExamStep extends RegisterForm {
  ExamStep({Key? key, required this.exam}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final Exam exam;

  @override
  getFields(field) {
    _formKey.currentState!.save();
    final fields = _formKey.currentState!.fields;
    exam.bloodPressure = fields["bloodPressure"]!.value;
    exam.pulsation = fields["pulsation"]!.value;
    exam.oximetry = fields["oximetry"]!.value;
    exam.skinColoring = fields["skinColoring"]!.value;
    exam.consistency = fields["consistency"]!.value;
    exam.skinTexture = fields["skinTexture"]!.value;
    exam.eyeColor = fields["eyeColor"]!.value;
    exam.hairColor = fields["hairColor"]!.value;
    exam.asymmetryType = Asymmetry.values[
        Asymmetry.getNameList().indexOf(fields["asymmetryType"]!.value)];
    exam.surfaceType = Surface
        .values[Surface.getNameList().indexOf(fields["surfaceType"]!.value)];
    exam.mobilityType = Mobility
        .values[Mobility.getNameList().indexOf(fields["mobilityType"]!.value)];
    exam.sensibilityType = Sensibility.values[
        Sensibility.getNameList().indexOf(fields["sensibilityType"]!.value)];
    exam.lipsType =
        Lip.values[Lip.getNameList().indexOf(fields["lipsType"]!.value)];
    exam.lipsTypeDescription = fields["lipsTypeDescription"]!.value;
    exam.tongueType = Tongue
        .values[Tongue.getNameList().indexOf(fields["tongueType"]!.value)];
    exam.tongueTypeDescription = fields["tongueTypeDescription"]!.value;
    exam.buccalMucosa = fields["buccalMucosa"]!.value;
    exam.gum = fields["gum"]!.value;
    exam.alveolarRidge = fields["alveolarRidge"]!.value;
    exam.retromolarTrigone = fields["retromolarTrigone"]!.value;
    exam.mouthFloor = fields["mouthFloor"]!.value;
    exam.palateModel = fields["palateModel"]!.value;
    exam.tonsilPillars = fields["tonsilPillars"]!.value;
    exam.variationNormality = fields["variationNormality"]!.value;
    exam.injuryPresence = fields["injuryPresence"]!.value;
    exam.injuryDescription = fields["injuryDescription"]!.value;
    exam.definitiveDiagnosis = fields["definitiveDiagnosis"]!.value;
    exam.diagnosticHypothesis = fields["diagnosticHypothesis"]!.value;
    exam.examResult = fields["examResult"]!.value;
    exam.complementaryExams = fields["complementaryExam"]!.value;
    exam.definitiveDiagnosis = fields["definitiveDiagnosis"]!.value;
    exam.conduct = fields["conduct"]!.value;
  }

  @override
  bool validate() {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSize.small),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            DefaultFormField(name: "bloodPressure", label: "Pressão arterial"),
            DefaultFormField(name: "pulsation", label: "Pulsação"),
            DefaultFormField(name: "oximetry", label: "Oximetria"),
            DefaultFormField(name: "skinColoring", label: "Coloração da pele"),
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
            DefaultFormField(
              name: "lipsTypeDescription",
              label: "Descrição do lábio",
              initialValue: exam.lipsTypeDescription,
            ),
            DefaultDropdownButton(
                name: "tongueType",
                label: "Língua",
                list: Tongue.getNameList(),
                initialValue: Tongue.getNameList()[0]),
            DefaultFormField(
              name: "tongueTypeDescription",
              label: "Descrição da língua",
              initialValue: exam.tongueTypeDescription,
            ),
            DefaultFormField(name: "buccalMucosa", label: "Mucosa jugal"),
            DefaultFormField(name: "gum", label: "Gengiva"),
            DefaultFormField(name: "alveolarRidge", label: "Rebordo alveolar"),
            DefaultFormField(
                name: "retromolarTrigone", label: "Trigono retromolar"),
            DefaultFormField(name: "mouthFloor", label: "Assoalho bocal"),
            DefaultFormField(name: "palateModel", label: "Palato moledura"),
            DefaultFormField(name: "tonsilPillars", label: "Pilares amígdala"),
            DefaultFormField(
                name: "variationNormality", label: "Variação normalidade"),
            DefaultFormField(
                name: "injuryPresence", label: "Presença de lesão"),
            DefaultFormField(
                name: "injuryDescription", label: "Descrição da lesão"),
            DefaultFormField(
                name: "diagnosticHypothesis", label: "Hipótese diagnóstica"),
            DefaultFormField(
                name: "complementaryExam", label: "Exames Complementares"),
            DefaultFormField(name: "examResult", label: "Resultado do exame"),
            DefaultFormField(
                name: "definitiveDiagnosis", label: "Diagnóstico definitivo"),
            DefaultFormField(name: "conduct", label: "conduta"),
          ],
        ),
      ),
    );
  }
}
