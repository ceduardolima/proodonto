import 'package:flutter/material.dart';
import 'package:proodonto/app/database/entity/anamnesis.dart';
import 'package:proodonto/app/shared/form_text.dart';

import '../../../shared/enum_types.dart';

class AnamnesisInfoData extends StatelessWidget {
  const AnamnesisInfoData({super.key, required this.anamnesis});

  final Anamnesis anamnesis;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormText(
          label: "Queixa principal",
          value: anamnesis.complain,
        ),
        FormText(
          label: "Histórico de doenças",
          value: anamnesis.diseaseHistory,
        ),
        FormText(
          label: "Sofre de alguma doença? Quais?",
          value: anamnesis.otherDiseases,
        ),
        FormText(
          label: "Tratamento atual",
          value: anamnesis.currentTreatment,
        ),
        FormText(
          label: "Para que?",
          value: anamnesis.forWhat,
        ),
        FormText(
          label: "Gravida?",
          value: anamnesis.pregnancy,
        ),
        FormText(
          label: "Quantos meses?",
          value: anamnesis.howManyMonth,
        ),
        FormText(
          label: "Realizou o exame pre natal?",
          value: anamnesis.prenatalExam,
        ),
        FormText(
          label: "Recomendação médica",
          value: anamnesis.medicalRecommendations,
        ),
        FormText(
          label: "Amamentando?",
          value: anamnesis.breastfeeding,
        ),
        FormText(
          label: "Faz uso de remédio? Quais?",
          value: anamnesis.whichMedicines,
        ),
        FormText(
          label: "Alergias?",
          value: anamnesis.allergy,
        ),
        FormText(
          label: "Fez alguma cirurgia? Quais?",
          value: anamnesis.surgery,
        ),
        FormText(
          label: "Possui problema de cicatrização?",
          value: anamnesis.hasHealingProblem,
        ),
        FormText(
          label: "Qual é a situação?",
          value: anamnesis.healingProblemSituation,
        ),
        FormText(
          label: "Problema com anestesia?",
          value: anamnesis.hasProblemWithAnesthesia,
        ),
        FormText(
          label: "Qual Situação?",
          value: anamnesis.problemWithAnesthesiaSituation,
        ),
        FormText(
          label: "Problema de hemorragia?",
          value: anamnesis.hasBleedingProblem,
        ),
        FormText(
          label: "Qual a situação?",
          value: anamnesis.bleedingProblemSituation,
        ),
        FormText(
          label: "Realizou quimioterapia?",
          value: anamnesis.underwentChemotherapy,
        ),
        FormText(
          label: "Realizou quimioterapia?",
          value: anamnesis.chemotherapyDate,
        ),
        FormText(
          label: "É fumante?",
          value: anamnesis.isSmoker,
        ),
        FormText(
          label: "Tipo de cigarro",
          value: anamnesis.cigaretteType,
        ),
        FormText(
          label: "Número de cigarros por dia",
          value: anamnesis.howManyCigarette,
        ),
        FormText(
          label: "É alcoolatra?",
          value: anamnesis.isAlcoholic,
        ),
        FormText(
          label: "Tipo de bebida",
          value: anamnesis.drinkType,
        ),
        FormText(
          label: "Outros hábitos",
          value: anamnesis.otherHabits,
        ),
        FormText(
          label: "Doenças presentes no histórico familiar",
          value: anamnesis.familyBackground,
        ),
        FormText(
          label: "Já fez tratamento dental?",
          value: anamnesis.dentalTreatment,
        ),
        FormText(
          label: "Última visita ao dentista",
          value: anamnesis.lastVisitToTheDentist,
        ),
        FormText(
          label: "Nome do médico",
          value: anamnesis.doctorName,
        ),
        FormText(
          label: "Teve alguma experiencia negativa",
          value: anamnesis.negativeExperience,
        ),
        FormText(
          label: "Qual foi o tipo do tratameto?",
          value: anamnesis.whatKindOfTreatment,
        ),
        FormText(
          label: "Número de escovações",
          value: anamnesis.brushNumber,
        ),
        FormText(
          label: "Tipo da escova",
          value: anamnesis.brushType,
        ),
        FormText(
          label: "Faz uso do fio dental?",
          value: anamnesis.useDentalFloss,
        ),
      ],
    );
  }
}
