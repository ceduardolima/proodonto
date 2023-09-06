import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/entity/anamnesis.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_radio_form_field.dart';
import 'package:proodonto/app/shared/default_radio_group.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/diseases.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';
import 'package:proodonto/app/shared/form_field_date_time.dart';
import 'package:proodonto/app/shared/multi_button.dart';

class AnamnesisRegister extends RegisterForm {
  AnamnesisRegister({Key? key, required this.anamnesis}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final Anamnesis anamnesis;

  String? getAllergy() {
    final fields = _formKey.currentState!.fields;
    List<String?>? value = fields["commonAllergy"]!.value;
    String? others = fields["othersAllergy"]!.value;
    if (value != null) {
      String commonAllergy =
          value.toString().replaceAll("[", "").replaceAll("]", "");
      if (others != null && others != "Não") {
        return "$commonAllergy, $others";
      }
      return commonAllergy;
    }
    return null;
  }

  String? getDiseases() {
    final fields = _formKey.currentState!.fields;
    List<String?>? value = fields["diseases"]!.value;
    String? others = fields["otherDiseases"]!.value;
    if (value != null) {
      String commonAllergy =
      value.toString().replaceAll("[", "").replaceAll("]", "");
      if (others != null && others != "Não") {
        return "$commonAllergy, $others";
      }
      return commonAllergy;
    }
    return null;
  }

  String? getFamilyBackground() {
    final fields = _formKey.currentState!.fields;
    List<String?>? value = fields["familyBackground"]!.value;
    String? others = fields["familyBackgroundCustom"]!.value;
    if (value != null) {
      String commonAllergy =
      value.toString().replaceAll("[", "").replaceAll("]", "");
      if (others != null && others != "Não") {
        return "$commonAllergy, $others";
      }
      return commonAllergy;
    }
    return null;
  }

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
    field.useMedicine = fields["useMedicine"]!.value;
    field.whichMedicines = fields["whichMedicine"]!.value;
    field.doctorName = fields["doctorName"]!.value;
    field.allergy = getAllergy();
    field.surgery = fields["hadSomeSurgery"]!.value;
    field.hasHealingProblem = fields["healingProblem"]!.value;
    field.healingProblemSituation =
        fields["whatIsTheSituationWithHealingProblem"]!.value;
    field.problemWithAnesthesiaSituation =
        fields["problemWithAnesthesiaSituation"]!.value;
    field.hasProblemWithAnesthesia = fields["hasProblemWithAnesthesia"]!.value;
    field.hasBleedingProblem = fields["hasProblemWithBleeding"]!.value;
    field.bleedingProblemSituation =
        fields["problemWithBleedingSituation"]!.value;
    field.otherDiseases = getDiseases();
    field.underwentChemotherapy = fields["underwentChemotherapy"]!.value;
    field.chemotherapyDate = fields["chemotherapyDate"]!.value?.toString();
    field.isSmoker = fields["isSmoker"]!.value;
    field.cigaretteType = fields["cigaretteType"]!.value;
    field.howManyCigarette = fields["howManyCigarettes"]!.value != null ? int.parse(fields["howManyCigarettes"]!.value.toString()) : 0;
    field.isAlcoholic = fields["isAlcoholic"]!.value;
    field.drinkType = fields["drinkType"]!.value;
    field.otherHabits = fields["otherHabits"]!.value;
    field.familyBackground = getFamilyBackground();
    field.dentalTreatment = fields["dentalTreatment"]!.value;
    field.useDentalFloss = fields["useDentalFloss"]!.value;
    field.lastVisitToTheDentist = fields["lastVisitToTheDentist"]!.value;
    field.negativeExperience = fields["negativeExperience"]!.value;
    field.whatKindOfTreatment = fields["whatKindOfTreatment"]!.value;
    field.brushNumber = fields["brushNumber"]!.value;
    field.brushType = fields["brushType"]!.value;
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
            MultiButton(
              name: "sufferFromSomeDisease",
              label: "Sofre de alguma doença?",
              children: [
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
              ],
            ),
            MultiButton(
              name: "pregnancy",
              label: "Gravida?",
              children: [
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
              ],
            ),
            MultiButton(
              name: "useMedicine",
              label: "Faz uso de remédio?",
              children: [
                DefaultFormField(
                  name: "whichMedicine",
                  label: "Quais remédios?",
                ),
              ],
            ),
            MultiButton(
              name: "haveAllergy",
              label: "Tem alergia?",
              children: [
                DefaultRadioGroup(
                  name: "commonAllergy",
                  label: "Alergias Comuns",
                  options: Allergy.getNameList(),
                ),
                DefaultFormField(
                  name: "othersAllergy",
                  label: "Alguma outra?",
                  initialValue: "Não",
                ),
              ],
            ),
            MultiButton(
              name: "sugery",
              label: "Fez alguma cirurgia?",
              children: [
                DefaultFormField(
                  name: "hadSomeSurgery",
                  label: "Quais?",
                ),
              ],
            ),
            MultiButton(
              name: "healingProblem",
              label: "Possui problema de cicatrização?",
              children: [
                DefaultFormField(
                  name: "whatIsTheSituationWithHealingProblem",
                  label: "Qual é a situação?",
                ),
              ],
            ),
            MultiButton(
              name: "hasProblemWithAnesthesia",
              label: "Problemas com anestesia?",
              children: [
                DefaultFormField(
                  name: "problemWithAnesthesiaSituation",
                  label: "Qual é a situação?",
                ),
              ],
            ),
            MultiButton(
              name: "hasProblemWithBleeding",
              label: "Problemas com hemorragia",
              children: [
                DefaultFormField(
                  name: "problemWithBleedingSituation",
                  label: "Qual é a situação situação",
                ),
              ],
            ),
            DefaultRadioGroup(
              name: "diseases",
              label: "Problemas",
              options: DISEASES
            ),
            DefaultFormField(name: "otherDiseases", label: "Algum outro problema?"),
            MultiButton(
              name: "underwentChemotherapy",
              label: "Realizou quimioterapia?",
              children: [
                FormFieldDateTime(
                  name: "chemotherapyDate",
                  label: "Realizou quimioterapia?",
                  initialDate: anamnesis.chemotherapyDate,
                ),
              ],
            ),
            MultiButton(
              name: "isSmoker",
              label: "É fumante?",
              children: [
                DefaultFormField(
                  name: "cigaretteType",
                  label: "Tipo de cigarro",
                  initialValue: anamnesis.cigaretteType,
                ),
                DefaultFormField(
                  name: "howManyCigarettes",
                  label: "Quantos cigarros por dia?",
                  inputType: TextInputType.number,
                  initialValue: anamnesis.howManyCigarette?.toString(),
                ),
              ],
            ),
            MultiButton(
              name: "isAlcoholic",
              label: "É alcoolatra?",
              children: [
                DefaultFormField(
                  name: "drinkType",
                  label: "Tipo de bebida",
                  initialValue: anamnesis.drinkType,
                ),
              ],
            ),
            DefaultFormField(
              name: "otherHabits",
              label: "Outros hábitos",
              initialValue: anamnesis.otherHabits,
            ),
            DefaultRadioGroup(
              name: "familyBackground",
              label: "Doenças presente no histórico familiar",
              options: FamilyBackground.getNameList(),
            ),
            DefaultFormField(
              name: "familyBackgroundCustom",
              label: "Alguma outra doença de histórico familiar?",
            ),
            MultiButton(
              name: "dentalTreatment",
              label: "Já fez tratamento dental?",
              children: [
                DefaultFormField(
                  name: "whatKindOfTreatment",
                  label: "Qual foi o tipo do tratameto?",
                  initialValue: anamnesis.whatKindOfTreatment,
                ),
              ],
            ),
            DefaultFormField(
              name: "lastVisitToTheDentist",
              label: "Última visita ao dentista",
              initialValue: anamnesis.lastVisitToTheDentist,
            ),
            DefaultFormField(
              name: "doctorName",
              label: "Nome do médico",
            ),
            DefaultFormField(
              name: "negativeExperience",
              label: "Teve alguma experiencia negativa?",
              initialValue: anamnesis.negativeExperience,
            ),
            DefaultFormField(
              name: "brushNumber",
              label: "Número de escovações por dia",
              inputType: TextInputType.number,
              initialValue: anamnesis.brushNumber,
            ),
            DefaultFormField(
              name: "brushType",
              label: "Tipo da escova",
            ),
            DefaultRadioButton(
              name: "useDentalFloss",
              label: "Faz uso do fio dental?",
            ),
          ],
        ),
      ),
    );
  }
}
