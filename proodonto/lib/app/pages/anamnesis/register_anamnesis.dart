import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/shared/default_size.dart';

class RegisterAnamnesisHome extends StatelessWidget {
  const RegisterAnamnesisHome({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrando Anamnese"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: PaddingSize.small, horizontal: PaddingSize.medium),
          child: Column(
            children: const [
              _AnamnesisFormField(
                  name: "chiefComplain", label: "Queixa principal"),
              _AnamnesisFormField(
                  name: "diseaseHistory", label: "Histórico de doenças"),
              _AnamnesisFormField(
                  name: "sufferFromSomeDisease",
                  label: "Sofre de alguma doença?"),
              _AnamnesisFormField(name: "whichDiases", label: "Quais doenças?"),
              _AnamnesisFormField(
                  name: "currentTreatment", label: "Tratamento atual"),
              _AnamnesisFormField(name: "forWhat", label: "Para que?"),
              _AnamnesisFormField(name: "pragnancy", label: "Gravida?"),
              _AnamnesisFormField(
                  name: "howManyMonth", label: "Quantos meses?"),
              _AnamnesisFormField(
                  name: "prenatalExam", label: "realizou o exame pre natal?"),
              _AnamnesisFormField(
                  name: "medicalRecomendation", label: "Recomendação médica"),
              _AnamnesisFormField(name: "breastfeeding", label: "Amamentando?"),
              _AnamnesisFormField(
                  name: "medicineUse", label: "Faz uso de remédio?"),
              _AnamnesisFormField(
                  name: "whichMedicine", label: "Quais remedios?"),
              _AnamnesisFormField(name: "doctorName", label: "Nome do médico"),
              _AnamnesisFormField(
                  name: "someTypeOfAllergy", label: "Algum tipo de alergia?"),
              _AnamnesisFormField(
                  name: "whichAllergy", label: "Quais alergias?"),
              _AnamnesisFormField(
                  name: "hadSomeSurgery", label: "Fez alguma cirurgia?"),
              _AnamnesisFormField(
                  name: "whichSurgery", label: "Quais cirurgias?"),
              _AnamnesisFormField(
                  name: "healingProblem",
                  label: "Possui problema de cicatrização?"),
              _AnamnesisFormField(
                  name: "whatIsTheSituationWithHealingProblem",
                  label: "Qual é a situação?"),
              _AnamnesisFormField(
                  name: "problemWithAnesthesia",
                  label: "Problema com anestesia?"),
              _AnamnesisFormField(
                  name: "whatIsTheSituationWithAnesthesiaProblem",
                  label: "Qual é a situação?"),
              _AnamnesisFormField(
                  name: "problemWithBleeding",
                  label: "Problema com hemorragia?"),
              _AnamnesisFormField(
                  name: "whatIsTheSituationWithBleedingProblem",
                  label: "Qual é a situação?"),
              _AnamnesisFormField(
                  name: "hasRheumaticFever", label: "Tem febre reumática?"),
              _AnamnesisFormField(
                  name: "hasKidneyProblems", label: "Tem problema renais?"),
              _AnamnesisFormField(
                  name: "hasRespiratoryProblems",
                  label: "Tem problemas respratórios?"),
              _AnamnesisFormField(
                  name: "hasJointProblems", label: "Tem problemas articulação"),
              _AnamnesisFormField(
                  name: "hasJointProblems",
                  label: "Tem problemas articulação?"),
              _AnamnesisFormField(
                  name: "hasHighBloodPressureProblem",
                  label: "Tem problemas de hipertensão arterial?"),
              _AnamnesisFormField(
                  name: "hasHeartPoblems", label: "Tem problemas cardíacos?"),
              _AnamnesisFormField(
                  name: "hasGastricProblem", label: "Tem problemas gástricos?"),
              _AnamnesisFormField(name: "hasAnemia", label: "Tem anemia?"),
              _AnamnesisFormField(name: "hasDiabetes", label: "Tem diabetes?"),
              _AnamnesisFormField(
                  name: "hasNeurologicalProblems",
                  label: "Tem problemas neurológicos?"),
              _AnamnesisFormField(
                  name: "infectiousDiseases", label: "Doença infecciosas"),
              _AnamnesisFormField(
                  name: "underwentChemotherapy",
                  label: "Realizou quimioterapia?"),
              _AnamnesisFormField(
                  name: "hasOnychophagy", label: "Tem onicofagia?"),
              _AnamnesisFormField(
                  name: "hasMouthPiece", label: "Tem repirador bucal?"),
              _AnamnesisFormField(name: "hasBruxism", label: "Tem bruxismo?"),
              _AnamnesisFormField(name: "isSmoker", label: "É fumante?"),
              _AnamnesisFormField(
                  name: "cigaretteType", label: "Tipo de cigarro?"),
              _AnamnesisFormField(name: "isAlcoholic", label: "É alcoólatra?"),
              _AnamnesisFormField(name: "drinkType", label: "Tipo de bebida?"),
              _AnamnesisFormField(
                  name: "otherHabits", label: "Outros hábitos?"),
              _AnamnesisFormField(
                  name: "familyBackground", label: "Antecendente familiar"),
              _AnamnesisFormField(name: "isAnxious", label: "É ansioso?"),
              _AnamnesisFormField(
                  name: "dentalTreatment", label: "Tratamento odontológico"),
              _AnamnesisFormField(
                  name: "lastVisitToTheDentist",
                  label: "Ultima visita ao dentista"),
              _AnamnesisFormField(
                  name: "negativeExperience", label: "Experiência negativa"),
              _AnamnesisFormField(
                  name: "whichNegativeExpeience", label: "Qual?"),
              _AnamnesisFormField(
                  name: "whatKindOfTreatment",
                  label: "Qual tipo de tratamento?"),
              _AnamnesisFormField(
                  name: "brushNumber", label: "Número da escova"),
              _AnamnesisFormField(name: "brushType", label: "Tipo da escova"),
              _AnamnesisFormField(
                  name: "useDentalFloss", label: "Usa fio dental?"),
              _AnamnesisFormField(
                  name: "dryMouthFeeling",
                  label: "Tem a sensação de boc seca?"),
              _AnamnesisFormField(name: "feelBurning", label: "Sente Ardor?"),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnamnesisFormField extends StatelessWidget {
  const _AnamnesisFormField(
      {required this.name,
      required this.label,
      this.hint,
      Key? key,
      this.inputType})
      : super(key: key);

  final String name;
  final String? hint;
  final String label;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderTextField(
        name: name,
        keyboardType: inputType,
        decoration: InputDecoration(labelText: label, hintText: hint),
      ),
    );
  }
}
