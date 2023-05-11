import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/pages/home/home.dart';
import '../../utils/default_size.dart';

class RegisterPatientHome extends StatelessWidget {
  const RegisterPatientHome({Key? key}) : super(key: key);

  void _finishRegister(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar paciente"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _RegisterPatientForm(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: PaddingSize.medium),
                  child: ElevatedButton(
                    onPressed: () => _finishRegister(context),
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: const Text("Próximo"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class _RegisterPatientForm extends StatelessWidget {
  _RegisterPatientForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RegisterPatientTextField(name: "PatientName", label: "Nome"),
        _RegisterPatientTextField(
            name: "PatientCPF", label: "CPF", hint: "000.000.000-01"),
        _RegisterPatientTextField(
            name: "PatientRG", label: "RG", hint: "1.000.111"),
        _RegisterPatientTextField(
            name: "issuingAgency", label: "Orgão expedidor"),
        _RegisterPatientTextField(
            name: "patientSkinColor", label: "Cor da pele"),
        _RegisterPatientTextField(
            name: "patientBirthday",
            label: "Data de nascimento",
            hint: "01/12/2000"),
        _RegisterPatientTextField(
          name: "patientFixNumber",
          label: "Telefone",
          hint: "3333-3333",
        ),
        _RegisterPatientTextField(name: "patientNumber", label: "Celular"),
        _RegisterPatientTextField(
          name: "patientEmail",
          label: "email",
        ),
        _RegisterPatientTextField(name: "patientAddress", label: "Endereço"),
        _RegisterPatientTextField(name: "patientCEP", label: "CEP"),
        _RegisterPatientTextField(name: "patientNeighborhood", label: "Bairro"),
        _RegisterPatientTextField(
            name: "patientPlaceOfBirth", label: "Naturalidade"),
        _RegisterPatientTextField(
            name: "patientNationality", label: "Nacionalidade"),
        _RegisterPatientTextField(name: "patientSex", label: "Sexo"),
        _RegisterPatientTextField(
            name: "patientMaritalStatus", label: "Estado civil"),
        _RegisterPatientTextField(
          name: "patientJob",
          label: "Profissão",
        ),
        _RegisterPatientTextField(
            name: "patientJobAddress", label: "Endereço da profissão"),
        _RegisterPatientTextField(
            name: "responsibleName", label: "Nome do responsável"),
        _RegisterPatientTextField(
            name: "responsibleAdress", label: "Endereço do responsável"),
        _RegisterPatientTextField(
            name: "responsibleRG", label: "RG do responsável"),
        _RegisterPatientTextField(
            name: "responsibleIssuingAgency",
            label: "Orgão expedidor do responsável"),
        _RegisterPatientTextField(
            name: "responsibleParentalRelationship", label: "Relação parental"),
        _RegisterPatientTextField(
            name: "responsibleNumber", label: "Telefone do responsável")
      ],
    );
  }
}

class _RegisterPatientTextField extends StatelessWidget {
  const _RegisterPatientTextField(
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
