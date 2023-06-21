import 'package:floor/floor.dart';
import 'package:proodonto/app/shared/enum_types.dart';

@Entity(tableName: "anamnesis")
class Anamnesis {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? patientCPF;
  String? complain;
  String? diseaseHistory;
  String? diseases;
  String? currentTreatment;
  String? forWhat;
  String? pregnancy;
  String? howManyMonth;
  bool? prenatalExam;
  String? medicalRecommendations;
  String? useMedicine;
  String? whichMedicines;
  String? doctorName;
  Allergy? allergy = Allergy.none;
  String? surgery;
  bool? hasHealingProblem;
  String? healingProblemSituation;
  bool? hasProblemWithAnesthesia;
  String? problemWithAnesthesiaSituation;
  bool? hasBleedingProblem;
  String? bleedingProblemSituation;
  bool? hasRheumaticFever;
  bool? hasKidneyProblem;
  bool? hasRespiratoryProblem;
  bool? hasJointProblem;
  bool? hasHighBloodPressureProblem;
  bool? hasHeartProblem;
  bool? hasGastricProblem;
  bool? hasAnemia;
  bool? hasDiabetes;
  bool? hasNeurologicalProblems;
  InfectiousDiseases? infectiousDiseases = InfectiousDiseases.none;
  bool? underwentChemotherapy;
  bool? hasOnychophagy;
  bool? hasMouthPiece;
  bool? hasBruxism;
  bool? isSmoker;
  String? cigaretteType;
  bool? isAlcoholic;
  String? drinkType;
  String? otherHabits;
  FamilyBackground? familyBackground = FamilyBackground.none;
  String? hasAnxiety;
  String? dentalTreatment;
  String? lastVisitToTheDentist;
  String? negativeExperience;
  String? whatKindOfTreatment;
  String? brushNumber;
  String? brushType;
  bool? useDentalFloss;
  bool? hasDryMouthFeeling;
  bool? feelBurning;

  Anamnesis({
      this.id,
      this.patientCPF,
      this.complain,
      this.diseaseHistory,
      this.diseases,
      this.currentTreatment,
      this.forWhat,
      this.pregnancy,
      this.howManyMonth,
      this.prenatalExam,
      this.medicalRecommendations,
      this.useMedicine,
      this.whichMedicines,
      this.doctorName,
      this.allergy,
      this.surgery,
      this.hasHealingProblem,
      this.healingProblemSituation,
      this.hasProblemWithAnesthesia,
      this.problemWithAnesthesiaSituation,
      this.hasBleedingProblem,
      this.bleedingProblemSituation,
      this.hasRheumaticFever,
      this.hasKidneyProblem,
      this.hasRespiratoryProblem,
      this.hasJointProblem,
      this.hasHighBloodPressureProblem,
      this.hasHeartProblem,
      this.hasGastricProblem,
      this.hasAnemia,
      this.hasDiabetes,
      this.hasNeurologicalProblems,
      this.infectiousDiseases,
      this.underwentChemotherapy,
      this.hasOnychophagy,
      this.hasMouthPiece,
      this.hasBruxism,
      this.isSmoker,
      this.cigaretteType,
      this.isAlcoholic,
      this.drinkType,
      this.otherHabits,
      this.familyBackground,
      this.hasAnxiety,
      this.dentalTreatment,
      this.lastVisitToTheDentist,
      this.negativeExperience,
      this.whatKindOfTreatment,
      this.brushNumber,
      this.brushType,
      this.useDentalFloss,
      this.hasDryMouthFeeling,
      this.feelBurning});
}