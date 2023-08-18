import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/exam.dart';
import 'package:proodonto/app/shared/enum_types.dart';

import '../../../shared/form_text.dart';

class ExamInfo extends StatelessWidget {
  const ExamInfo({super.key, required this.exam, });

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormText(
          label: "CPF do paciênte",
          value: exam.patientCPF,
        ),
        FormText(
          label: "Cor da pele",
          value: SkinColor.getNameList()[exam.skinColor!.index],
        ),
        FormText(
          label: "Peso",
          value: exam.weight,
        ),
        FormText(
          label: "altura",
          value: exam.height,
        ),
        FormText(
          label: "Temperatura",
          value: exam.temperature,
        ),
        FormText(
          label: "Tipo Geral",
          value: GeneralType.getNameList()[exam.generalType!.index],
        ),
        FormText(
          label: "Outras observações",
          value: exam.othersObservations,
        ),
        FormText(
          label: "Pressão arterial",
          value: exam.bloodPressure,
        ),
        FormText(
          label: "Pulsação",
          value: exam.pulsation,
        ),
        FormText(
          label: "Oximetria",
          value: exam.oximetry,
        ),
        FormText(
          label: "Coloração da pele",
          value: exam.skinColoring,
        ),
        FormText(
          label: "Consistência",
          value: exam.consistency,
        ),
        FormText(
          label: "Textura da pele",
          value: exam.skinTexture,
        ),
        FormText(
          label: "Cor dos olhos",
          value: exam.eyeColor,
        ),
        FormText(
          label: "Cor dos cabelos",
          value: exam.hairColor,
        ),
        FormText(
          label: "Assimetria",
          value: Asymmetry.getNameList()[exam.asymmetryType!.index],
        ),
        FormText(
          label: "Tipo de superficie",
          value: Surface.getNameList()[exam.surfaceType!.index],
        ),
        FormText(
          label: "Mobilidade",
          value: Mobility.getNameList()[exam.mobilityType!.index],
        ),
        FormText(
          label: "Sensibilidade",
          value: Sensibility.getNameList()[exam.sensibilityType!.index],
        ),
        FormText(
          label: "Tipo de lábio",
          value: Lip.getNameList()[exam.lipsType!.index],
        ),
        FormText(
          label: "Tipo de língua",
          value: Tongue.getNameList()[exam.tongueType!.index],
        ),
        FormText(
          label: "Mucosa jugal",
          value: exam.buccalMucosa,
        ),
        FormText(
          label: "Gengiva",
          value: exam.gum,
        ),
        FormText(
          label: "Rebordo alveolar",
          value: exam.alveolarRidge,
        ),
        FormText(
          label: "Trigono retromolar",
          value: exam.retromolarTrigone,
        ),
        FormText(
          label: "Assoalho bocal",
          value: exam.mouthFloor,
        ),
        FormText(
          label: "Palato moledura",
          value: exam.palateModel,
        ),
        FormText(
          label: "Pilares amígdala",
          value: exam.tonsilPillars,
        ),
        FormText(
          label: "Variação normalidade",
          value: exam.variationNormality,
        ),
        FormText(
          label: "Presença de lesão",
          value: exam.injuryPresence,
        ),
        FormText(
          label: "Descrição da lesão",
          value: exam.injuryDescription,
        ),
        FormText(
          label: "Hipótese diagnóstica",
          value: exam.diagnosticHypothesis,
        ),
        FormText(
          label: "Exames Complementares",
          value: exam.complementaryExams,
        ),
        FormText(
          label: "Resultado do exame",
          value: exam.examResult,
        ),
        FormText(
          label: "conduta",
          value: exam.conduct,
        ),
        FormText(
          label: "Diagnóstico definitivo",
          value: exam.definitiveDiagnosis,
        ),
      ],
    );
  }
}
