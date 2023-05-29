import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_radio_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';
import 'package:proodonto/app/widget/buttons.dart';

class RegisterAnamnesisHome extends StatelessWidget {
  const RegisterAnamnesisHome({Key? key, required this.database})
      : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrando Anamnese"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: PaddingSize.small, horizontal: PaddingSize.medium),
          child: Column(
            children: [
              DefaultFormField(
                  name: "chiefComplain", label: "Queixa principal"),
              DefaultFormField(
                  name: "diseaseHistory", label: "Histórico de doenças"),
              DefaultFormField(
                  name: "sufferFromSomeDisease",
                  label: "Sofre de alguma doença?"),
              DefaultFormField(name: "whichDiases", label: "Quais doenças?"),
              DefaultFormField(
                  name: "currentTreatment", label: "Tratamento atual"),
              DefaultFormField(name: "forWhat", label: "Para que?"),
              DefaultRadioButton(name: "pragnancy", label: "Gravida?"),
              DefaultFormField(name: "howManyMonth", label: "Quantos meses?"),
              DefaultRadioButton(
                  name: "prenatalExam", label: "realizou o exame pre natal?"),
              DefaultFormField(
                  name: "medicalRecomendation", label: "Recomendação médica"),
              DefaultRadioButton(name: "breastfeeding", label: "Amamentando?"),
              DefaultFormField(
                  name: "medicineUse", label: "Faz uso de remédio? Quais?"),
              DefaultFormField(name: "doctorName", label: "Nome do médico"),
              DefaultDropdownButton(
                name: "whichAllergy",
                label: "Quais alergias?",
                list: Allergy.getNameList(),
              ),
              DefaultFormField(
                  name: "hadSomeSurgery", label: "Fez alguma cirurgia? Quais?"),
              DefaultFormField(
                  name: "healingProblem",
                  label: "Possui problema de cicatrização?"),
              DefaultFormField(
                  name: "whatIsTheSituationWithHealingProblem",
                  label: "Qual é a situação?"),
              DefaultFormField(
                  name: "problemWithAnesthesia",
                  label: "Problema com anestesia?"),
              DefaultFormField(
                  name: "problemWithBleeding",
                  label: "Problema com hemorragia?"),
              DefaultRadioButton(
                  name: "hasRheumaticFever", label: "Tem febre reumática?"),
              DefaultRadioButton(
                  name: "hasKidneyProblems", label: "Tem problema renais?"),
              DefaultRadioButton(
                  name: "hasRespiratoryProblems",
                  label: "Tem problemas respratórios?"),
              DefaultRadioButton(
                  name: "hasJointProblems", label: "Tem problemas articulação"),
              DefaultRadioButton(
                  name: "hasJointProblems",
                  label: "Tem problemas articulação?"),
              DefaultRadioButton(
                  name: "hasHighBloodPressureProblem",
                  label: "Tem problemas de hipertensão arterial?"),
              DefaultRadioButton(
                  name: "hasHeartPoblems", label: "Tem problemas cardíacos?"),
              DefaultRadioButton(
                  name: "hasGastricProblem", label: "Tem problemas gástricos?"),
              DefaultRadioButton(name: "hasAnemia", label: "Tem anemia?"),
              DefaultRadioButton(name: "hasDiabetes", label: "Tem diabetes?"),
              DefaultRadioButton(
                  name: "hasNeurologicalProblems",
                  label: "Tem problemas neurológicos?"),
              DefaultDropdownButton(
                  name: "infectiousDiseases", label: "Doença infecciosas", list: InfectiousDiseases.getNameList(),),
              DefaultRadioButton(
                  name: "underwentChemotherapy",
                  label: "Realizou quimioterapia?"),
              DefaultRadioButton(
                  name: "hasOnychophagy", label: "Tem onicofagia?"),
              DefaultRadioButton(
                  name: "hasMouthPiece", label: "Tem repirador bucal?"),
              DefaultRadioButton(name: "hasBruxism", label: "Tem bruxismo?"),
              DefaultRadioButton(name: "isSmoker", label: "É fumante?"),
              DefaultFormField(
                  name: "cigaretteType", label: "Tipo de cigarro?"),
              DefaultRadioButton(name: "isAlcoholic", label: "É alcoólatra?"),
              DefaultFormField(name: "drinkType", label: "Tipo de bebida?"),
              DefaultFormField(
                  name: "otherHabits", label: "Outros hábitos?"),
              DefaultFormField(
                  name: "familyBackground", label: "Antecendente familiar"),
              DefaultRadioButton(name: "isAnxious", label: "É ansioso?"),
              DefaultFormField(
                  name: "dentalTreatment", label: "Tratamento odontológico"),
              DefaultFormField(
                  name: "lastVisitToTheDentist",
                  label: "Ultima visita ao dentista"),
              DefaultFormField(
                  name: "negativeExperience", label: "Experiência negativa"),
              DefaultFormField(
                  name: "whatKindOfTreatment",
                  label: "Qual tipo de tratamento?"),
              DefaultFormField(
                  name: "brushNumber", label: "Número da escova"),
              DefaultFormField(name: "brushType", label: "Tipo da escova"),
              DefaultRadioButton(
                  name: "useDentalFloss", label: "Usa fio dental?"),
              DefaultRadioButton(
                  name: "dryMouthFeeling",
                  label: "Tem a sensação de boc seca?"),
              DefaultRadioButton(name: "feelBurning", label: "Sente Ardor?"),
              DefaultButton(text: "Finalizar", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
