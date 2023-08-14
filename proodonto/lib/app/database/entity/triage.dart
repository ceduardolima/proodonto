import 'dart:core';

import 'package:floor/floor.dart';

@Entity(tableName: "triage")
class Triage {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? patientCPF;
  String? operatorCPF;
  String? operatorName;
  String? patientName;
  int? recordNumber;
  String? reasonForConsultation;
  bool? hasCovid;
  bool? hasCough;
  String? testType;
  String? kinship;
  bool? hasFever;
  bool? hasDifficultyToBreathing;
  bool? hasTiredness;
  bool? hasLossOfSmell;
  bool? hasLossOfTaste;
  bool? hasSoreThroat;
  bool? hasHeadache;
  bool? hasDiarrhea;
  String? oximetry;
  String? heartRate;
  String? temperature;

  Triage(
      {this.id,
      this.patientCPF,
      this.operatorCPF,
      this.operatorName,
      this.patientName,
      this.recordNumber,
      this.reasonForConsultation,
      this.hasCovid,
      this.testType,
      this.kinship,
        this.hasCough,
      this.hasFever,
      this.hasDifficultyToBreathing,
      this.hasTiredness,
      this.hasLossOfSmell,
      this.hasLossOfTaste,
      this.hasSoreThroat,
      this.hasHeadache,
      this.hasDiarrhea,
      this.oximetry,
      this.heartRate,
      this.temperature});
}
