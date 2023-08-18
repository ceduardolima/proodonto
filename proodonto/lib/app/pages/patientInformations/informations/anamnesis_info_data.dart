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
          label: "Sofre de alguma doença?",
          value: anamnesis.diseases,
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
          label: "realizou o exame pre natal?",
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
          label: "Nome do médico",
          value: anamnesis.doctorName,
        ),
        FormText(
          label: "Quais alergias?",
          value: Allergy.getNameList()[anamnesis.allergy!.index],
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
          label: "Problema com hemorragia?",
          value: anamnesis.hasBleedingProblem,
        ),
        FormText(
          label: "Qual a situação?",
          value: anamnesis.bleedingProblemSituation,
        ),
        FormText(
          label: "Tem febre reumática?",
          value: anamnesis.hasRheumaticFever,
        ),
        FormText(
          label: "Tem problemas nas articulações?",
          value: anamnesis.hasJointProblem,
        ),
        FormText(
          label: "Tem problema renais?",
          value: anamnesis.hasKidneyProblem,
        ),
        FormText(
          label: "Tem problemas respratórios?",
          value: anamnesis.hasRespiratoryProblem,
        ),
        FormText(
          label: "Tem problemas articulação",
          value: anamnesis.hasJointProblem,
        ),
        FormText(
          label: "Tem problemas de hipertensão arterial?",
          value: anamnesis.hasHighBloodPressureProblem,
        ),
        FormText(
          label: "Tem problemas cardíacos?",
          value: anamnesis.hasHeartProblem,
        ),
        FormText(
          label: "Tem problemas gástricos?",
          value: anamnesis.hasGastricProblem,
        ),
        FormText(
          label: "Tem anemia?",
          value: anamnesis.hasAnemia,
        ),
        FormText(
          label: "Tem diabetes?",
          value: anamnesis.hasDiabetes,
        ),
        FormText(
          label: "Tem problemas neurológicos?",
          value: anamnesis.hasNeurologicalProblems,
        ),
        FormText(
          label: "Doença infecciosas",
          value: InfectiousDiseases.getNameList()[
              anamnesis.infectiousDiseases!.index],
        ),
        FormText(
          label: "Realizou quimioterapia?",
          value: anamnesis.underwentChemotherapy,
        ),
        FormText(
          label: "Tem onicofagia?",
          value: anamnesis.hasOnychophagy,
        ),
        FormText(
          label: "Tem repirador bucal?",
          value: anamnesis.hasMouthPiece,
        ),
        FormText(
          label: "Tem bruxismo?",
          value: anamnesis.hasBruxism,
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
          label: "Doenças presente no histórico familiar",
          value:
              FamilyBackground.getNameList()[anamnesis.familyBackground!.index],
        ),
        FormText(
          label: "Tem ansiedade?",
          value: anamnesis.hasAnxiety,
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
          label: "Teve alguma experiencia negativa",
          value: anamnesis.negativeExperience,
        ),
        FormText(
          label: "Qual foi o tipo do tratameto?",
          value: anamnesis.whatKindOfTreatment,
        ),
        FormText(
          label: "Número da escova",
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
        FormText(
          label: "Tem a sensação de boca seca?",
          value: anamnesis.hasDryMouthFeeling,
        ),
        FormText(
          label: "Sente a boca queimando?",
          value: anamnesis.feelBurning,
        ),
      ],
    );
  }
}
