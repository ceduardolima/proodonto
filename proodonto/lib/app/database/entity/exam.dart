import 'package:floor/floor.dart';
import 'package:proodonto/app/shared/enum_types.dart';

@Entity(tableName: "exam")
class Exam {
  @PrimaryKey(autoGenerate: true)
  int? id;
  int? recordNumber;
  GeneralType? generalType;
  String? weight;
  String? height;
  String? temperature;
  String? bloodPressure;
  String? pulsation;
  String? oximetry;
  String? othersObservations;
  SkinColor? skinColor;
  String? skinColoring;
  String? consistency;
  String? skinTexture;
  String? eyeColor;
  String? hairColor;
  Asymmetry? asymmetryType;
  Surface? surfaceType;
  Mobility? mobilityType;
  Sensibility? sensibilityType;
  Lip? lipsType;
  Tongue? tongueType;
  String? buccalMucosa;
  String? gum;
  String? alveolarRidge;
  String? retromolarTrigone;
  String? mouthFloor;
  String? palateModel;
  String? tonsilPillars;
  String? variationNormality;
  String? whichVariations;
  String? injuryPresence;
  String? injuryDescription;
  String? complementaryExams;
  String? examResult;
  String? definitiveDiagnosis;
  String? conduct;
  String? diagnosticHypothesis;

  Exam(
      {this.id,
      this.recordNumber,
      this.generalType,
      this.weight,
      this.height,
      this.temperature,
      this.bloodPressure,
      this.pulsation,
      this.oximetry,
      this.othersObservations,
      this.skinColor,
      this.skinColoring,
      this.consistency,
      this.skinTexture,
      this.eyeColor,
      this.hairColor,
      this.asymmetryType,
      this.surfaceType,
      this.mobilityType,
      this.sensibilityType,
      this.lipsType,
      this.tongueType,
      this.buccalMucosa,
      this.gum,
      this.alveolarRidge,
      this.retromolarTrigone,
      this.mouthFloor,
      this.palateModel,
      this.tonsilPillars,
      this.variationNormality,
      this.whichVariations,
      this.injuryPresence,
      this.injuryDescription,
      this.complementaryExams,
      this.examResult,
      this.definitiveDiagnosis,
      this.diagnosticHypothesis,
      this.conduct});

  @override
  String toString() {
    return 'Exam{id: $id, recordNumber: $recordNumber, generalType: $generalType, weight: $weight, height: $height, temperature: $temperature, bloodPressure: $bloodPressure, pulsation: $pulsation, oximetry: $oximetry, othersObservations: $othersObservations, skinColor: $skinColor, skinColoring: $skinColoring, consistency: $consistency, skinTexture: $skinTexture, eyeColor: $eyeColor, hairColor: $hairColor, asymmetryType: $asymmetryType, surfaceType: $surfaceType, mobilityType: $mobilityType, sensibilityType: $sensibilityType, lipsType: $lipsType, tongueType: $tongueType, buccalMucosa: $buccalMucosa, gum: $gum, alveolarRidge: $alveolarRidge, retromolarTrigone: $retromolarTrigone, mouthFloor: $mouthFloor, palateModel: $palateModel, tonsilPillars: $tonsilPillars, variationNormality: $variationNormality, whichVariations: $whichVariations, injuryPresence: $injuryPresence, injuryDescription: $injuryDescription, complementaryExams: $complementaryExams, examResult: $examResult, definitiveDiagnosis: $definitiveDiagnosis, conduct: $conduct, diagnosticHypothesis: $diagnosticHypothesis}';
  }
}
