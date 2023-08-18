import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/entity/anamnesis.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_radio_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';

class AnamnesisRegister extends RegisterForm {
  AnamnesisRegister({Key? key, required this.anamnesis}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final Anamnesis anamnesis;

  @override
  getFields(field) {
    _formKey.currentState!.save();
    final fields = _formKey.currentState!.fields;
    field.complain = fields["chiefComplain"]!.value;
    field.diseaseHistory = fields["diseaseHistory"]!.value;
    field.diseases = fields["whichDisease"]!.value;
    field.currentTreatment = fields["currentTreatment"]!.value;
    field.forWhat = fields["forWhat"]!.value;
    field.pregnancy = fields["pregnancy"]!.value;
    field.howManyMonth = fields["howManyMonth"]!.value;
    field.prenatalExam = fields["prenatalExam"]!.value;
    field.medicalRecommendations = fields["medicalRecommendation"]!.value;
    field.breastfeeding = fields["breastfeeding"]!.value;
    field.whichMedicines = fields["medicineUse"]!.value;
    field.doctorName = fields["doctorName"]!.value;
    field.allergy =
        Allergy.values[Allergy.getNameList().indexOf(fields["allergy"]!.value)];
    field.surgery = fields["hadSomeSurgery"]!.value;
    field.hasHealingProblem = fields["healingProblem"]!.value;
    field.healingProblemSituation =
        fields["whatIsTheSituationWithHealingProblem"]!.value;
    field.problemWithAnesthesiaSituation =
        fields["problemWithAnesthesiaSituation"]!.value;
    field.bleedingProblemSituation = fields["problemWithBleeding"]!.value;
    field.hasRheumaticFever = fields["hasRheumaticFever"]!.value;
    field.hasKidneyProblem = fields["hasKidneyProblems"]!.value;
    field.hasRespiratoryProblem = fields["hasRespiratoryProblems"]!.value;
    field.hasHighBloodPressureProblem =
        fields["hasHighBloodPressureProblem"]!.value;
    field.hasHeartProblem = fields["hasHeartProblem"]!.value;
    field.hasGastricProblem = fields["hasGastricProblem"]!.value;
    field.hasAnemia = fields["hasAnemia"]!.value;
    field.hasDiabetes = fields["hasDiabetes"]!.value;
    field.hasNeurologicalProblems = fields["hasNeurologicalProblems"]!.value;
    field.infectiousDiseases = InfectiousDiseases.values[
        InfectiousDiseases.getNameList()
            .indexOf(fields["infectiousDiseases"]!.value)];
    field.underwentChemotherapy = fields["underwentChemotherapy"]!.value;
    field.hasOnychophagy = fields["hasOnychophagy"]!.value;
    field.hasMouthPiece = fields["hasMouthPiece"]!.value;
    field.isSmoker = fields["isSmoker"]!.value;
    field.cigaretteType = fields["cigaretteType"]!.value;
    field.isAlcoholic = fields["isAlcoholic"]!.value;
    field.drinkType = fields["drinkType"]!.value;
    field.otherHabits = fields["otherHabits"]!.value;
    field.familyBackground = FamilyBackground.values[
        FamilyBackground.getNameList()
            .indexOf(fields["familyBackground"]!.value)];
    field.hasAnxiety = fields["hasAnxiety"]!.value;
    field.hasBruxism = fields["hasBruxism"]!.value;
    field.hasJointProblem = fields["hasJointProblem"]!.value;
    field.dentalTreatment = fields["dentalTreatment"]!.value;
    field.useDentalFloss = fields["useDentalFloss"]!.value;
    field.lastVisitToTheDentist = fields["lastVisitToTheDentist"]!.value;
    field.negativeExperience = fields["negativeExperience"]!.value;
    field.whatKindOfTreatment = fields["whatKindOfTreatment"]!.value;
    field.brushNumber = fields["brushNumber"]!.value;
    field.brushType = fields["brushType"]!.value;
    field.hasDryMouthFeeling = fields["hasDryMouthFeeling"]!.value;
    field.feelBurning = fields["feelBurning"]!.value;
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
            DefaultFormField(
              name: "chiefComplain",
              label: "Queixa principal",
            ),
            DefaultFormField(
              name: "diseaseHistory",
              label: "Histórico de doenças",
            ),
            DefaultFormField(
              name: "sufferFromSomeDisease",
              label: "Sofre de alguma doença?",
            ),
            DefaultFormField(
              name: "whichDisease",
              label: "Quais doenças?",
            ),
            DefaultFormField(
              name: "currentTreatment",
              label: "Tratamento atual",
            ),
            DefaultFormField(
              name: "forWhat",
              label: "Para que?",
            ),
            DefaultRadioButton(
              name: "pregnancy",
              label: "Gravida?",
            ),
            DefaultFormField(
              name: "howManyMonth",
              label: "Quantos meses?",
            ),
            DefaultRadioButton(
              name: "prenatalExam",
              label: "realizou o exame pre natal?",
            ),
            DefaultFormField(
              name: "medicalRecommendation",
              label: "Recomendação médica",
            ),
            DefaultRadioButton(
              name: "breastfeeding",
              label: "Amamentando?",
            ),
            DefaultFormField(
              name: "medicineUse",
              label: "Faz uso de remédio? Quais?",
            ),
            DefaultFormField(
              name: "doctorName",
              label: "Nome do médico",
            ),
            DefaultDropdownButton(
              name: "allergy",
              label: "Quais alergias?",
              list: Allergy.getNameList(),
              initialValue: Allergy.getNameList()[0],
            ),
            DefaultFormField(
              name: "hadSomeSurgery",
              label: "Fez alguma cirurgia? Quais?",
            ),
            DefaultRadioButton(
              name: "healingProblem",
              label: "Possui problema de cicatrização?",
            ),
            DefaultFormField(
              name: "whatIsTheSituationWithHealingProblem",
              label: "Qual é a situação?",
            ),
            DefaultFormField(
              name: "problemWithAnesthesiaSituation",
              label: "Problema com anestesia?",
            ),
            DefaultFormField(
              name: "problemWithBleeding",
              label: "Problema com hemorragia?",
            ),
            DefaultRadioButton(
              name: "hasRheumaticFever",
              label: "Tem febre reumática?",
            ),
            DefaultRadioButton(
              name: "hasJointProblem",
              label: "Tem problemas nas articulações?",
            ),
            DefaultRadioButton(
              name: "hasKidneyProblems",
              label: "Tem problema renais?",
            ),
            DefaultRadioButton(
              name: "hasRespiratoryProblems",
              label: "Tem problemas respratórios?",
            ),
            DefaultRadioButton(
              name: "hasJointProblems",
              label: "Tem problemas articulação",
            ),
            DefaultRadioButton(
              name: "hasHighBloodPressureProblem",
              label: "Tem problemas de hipertensão arterial?",
            ),
            DefaultRadioButton(
              name: "hasHeartProblem",
              label: "Tem problemas cardíacos?",
            ),
            DefaultRadioButton(
              name: "hasGastricProblem",
              label: "Tem problemas gástricos?",
            ),
            DefaultRadioButton(
              name: "hasAnemia",
              label: "Tem anemia?",
            ),
            DefaultRadioButton(
              name: "hasDiabetes",
              label: "Tem diabetes?",
            ),
            DefaultRadioButton(
              name: "hasNeurologicalProblems",
              label: "Tem problemas neurológicos?",
            ),
            DefaultDropdownButton(
              name: "infectiousDiseases",
              label: "Doença infecciosas",
              list: InfectiousDiseases.getNameList(),
              initialValue: InfectiousDiseases.getNameList()[0],
            ),
            DefaultRadioButton(
              name: "underwentChemotherapy",
              label: "Realizou quimioterapia?",
            ),
            DefaultRadioButton(
              name: "hasOnychophagy",
              label: "Tem onicofagia?",
            ),
            DefaultRadioButton(
              name: "hasMouthPiece",
              label: "Tem repirador bucal?",
            ),
            DefaultRadioButton(
              name: "hasBruxism",
              label: "Tem bruxismo?",
            ),
            DefaultRadioButton(
              name: "isSmoker",
              label: "É fumante?",
            ),
            DefaultFormField(
              name: "cigaretteType",
              label: "Tipo de cigarro",
            ),
            DefaultRadioButton(
              name: "isAlcoholic",
              label: "É alcoolatra?",
            ),
            DefaultFormField(
              name: "drinkType",
              label: "Tipo de bebida",
            ),
            DefaultFormField(
              name: "otherHabits",
              label: "Outros hábitos",
            ),
            DefaultDropdownButton(
              name: "familyBackground",
              label: "Doenças presente no histórico familiar",
              list: FamilyBackground.getNameList(),
              initialValue: FamilyBackground.getNameList()[0],
            ),
            DefaultRadioButton(
              name: "hasAnxiety",
              label: "Tem ansiedade?",
            ),
            DefaultFormField(
              name: "dentalTreatment",
              label: "Já fez tratamento dental?",
            ),
            DefaultFormField(
              name: "lastVisitToTheDentist",
              label: "Última visita ao dentista",
            ),
            DefaultFormField(
              name: "negativeExperience",
              label: "Teve alguma experiencia negativa",
            ),
            DefaultFormField(
                name: "whatKindOfTreatment",
                label: "Qual foi o tipo do tratameto?"),
            DefaultFormField(
              name: "brushNumber",
              label: "Número da escova",
            ),
            DefaultFormField(
              name: "brushType",
              label: "Tipo da escova",
            ),
            DefaultRadioButton(
              name: "useDentalFloss",
              label: "Faz uso do fio dental?",
            ),
            DefaultRadioButton(
              name: "hasDryMouthFeeling",
              label: "Tem a sensação de boca seca?",
            ),
            DefaultRadioButton(
              name: "feelBurning",
              label: "Sente a boca queimando?",
            ),
          ],
        ),
      ),
    );
  }
}
