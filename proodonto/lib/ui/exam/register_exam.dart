import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

import '../../utils/default_size.dart';

class RegisterExamHome extends StatelessWidget {
  const RegisterExamHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Exame"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingSize.small, horizontal: PaddingSize.medium),
          child: Column(
            children: const [
              _ExamFormField(name: "generalType", label: "Tipo Geral"),
              _ExamFormField(name: "weight", label: "Peso"),
              _ExamFormField(name: "height", label: "altura"),
              _ExamFormField(name: "temperature", label: "Temperatura"),
              _ExamFormField(name: "bloodPressure", label: "Pressão arterial"),
              _ExamFormField(name: "pulsation", label: "Pulsação"),
              _ExamFormField(name: "oximetry", label: "Oximetria"),
              _ExamFormField(name: "othersObservations", label: "Outras observações"),
              _ExamFormField(name: "othersObservations", label: "Outras observações"),
              _ExamFormField(name: "skinColor", label: "Cor da pele"),
              _ExamFormField(name: "skinColoring", label: "Coloração da pele"),
              _ExamFormField(name: "consistency", label: "Consistência"),
              _ExamFormField(name: "skinTexture", label: "Textura da pele"),
              _ExamFormField(name: "eyeColor", label: "Cor dos olhos"),
              _ExamFormField(name: "hairColor", label: "Cor dos cabelos"),
              _ExamFormField(name: "asymmetryType", label: "Tipo de assimetria"),
              _ExamFormField(name: "surfaceType", label: "Tipo de superficie"),
              _ExamFormField(name: "mobilityType", label: "Tipo de mobilidade"),
              _ExamFormField(name: "sensibilityType", label: "Tipo de sensibilidade"),
              _ExamFormField(name: "lipsType", label: "Tipo de lábio"),
              _ExamFormField(name: "tongType", label: "Tipo de língua"),
              _ExamFormField(name: "buccalMucosa", label: "Mucosa jugal"),
              _ExamFormField(name: "gum", label: "Gengiva"),
              _ExamFormField(name: "alveolarRidge", label: "Rebordo alveolar"),
              _ExamFormField(name: "retromolarTrigone", label: "Trigono retromolar"),
              _ExamFormField(name: "mouthFloor", label: "Assoalho bocal"),
              _ExamFormField(name: "palateModel", label: "Palato moledura"),
              _ExamFormField(name: "tonsilPillars", label: "Pilares amígdala"),
              _ExamFormField(name: "variationNormality", label: "Variação normalidade"),
              _ExamFormField(name: "which", label: "quais"),
              _ExamFormField(name: "presenceInjury", label: "Presença de lesão"),
              _ExamFormField(name: "injuryDescription", label: "Descrição da lesão"),
              _ExamFormField(name: "diagnosticHypothesis", label: "Hipótese diagnóstica"),
              _ExamFormField(name: "complementaryExam", label: "Exames Complementares"),
              _ExamFormField(name: "whichExams", label: "Quais Exames?"),
              _ExamFormField(name: "examResult", label: "Resultado do exame"),
              _ExamFormField(name: "definitiveDiagnosis", label: "Diagnóstico definitivo"),
              _ExamFormField(name: "conduct", label: "conduta"),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExamFormField extends StatelessWidget {
  const _ExamFormField({required this.name,
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
