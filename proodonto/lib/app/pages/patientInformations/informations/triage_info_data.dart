import 'package:flutter/material.dart';
import 'package:proodonto/app/database/entity/triage.dart';

import '../../../database/database.dart';
import '../../../shared/form_text.dart';

class TriageInfoData extends StatelessWidget {
  const TriageInfoData({
    super.key,
    required this.triage,
  });

  final Triage triage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormText(
          label: "CPF do operador",
          value: triage.operatorName,
        ),
        FormText(
          label: "Número do prontuário",
          value: triage.recordNumber,
        ),
        FormText(
          label: "Nome do paciênte",
          value: triage.patientName,
        ),
        FormText(
          label: "CPF do paciênte",
          value: triage.patientCPF,
        ),
        FormText(
          label: "Razão da consulta",
          value: triage.reasonForConsultation,
        ),
        FormText(
          label: "Febre",
          value: triage.hasFever,
        ),
        FormText(
          label: "Confirmação de covid",
          value: triage.hasCovid,
        ),
        FormText(
          label: "Tipo do teste",
          value: triage.testType,
        ),
        FormText(
          label: "Cansaço",
          value: triage.hasTiredness,
        ),
        FormText(
          label: "Dificuldade Para respirar",
          value: triage.hasDifficultyToBreathing,
        ),
        FormText(
          label: "Tosse",
          value: triage.hasCough,
        ),
        FormText(label: "Perda de olfato", value: triage.hasLossOfSmell),
        FormText(label: "Perda do paladar", value: triage.hasLossOfTaste),
        FormText(
          label: "Dor na garganta",
          value: triage.hasSoreThroat,
        ),
        FormText(
          label: "Dor de cabeça",
          value: triage.hasHeadache,
        ),
        FormText(
          label: "Diarreia",
          value: triage.hasDiarrhea,
        ),
        FormText(
          label: "Oximatria",
          value: triage.oximetry,
        ),
        FormText(
          label: "Frequência cardíaca",
          value: triage.heartRate,
        ),
        FormText(
          label: "Temperatura",
          suffix: "ºC",
          value: triage.temperature,
        ),
      ],
    );
  }
}
