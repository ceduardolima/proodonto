import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/pages/patient/register_patient_responsible.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';

import '../../database/entity/patient.dart';

class RegisterPatientInformationHome extends StatelessWidget {

  const RegisterPatientInformationHome(
      {Key? key, required this.database, required this.patient})
      : super(key: key);
  final ProodontoDatabase database;
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar paciente"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
        child: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: PaddingSize.medium),
                child: _RegisterPatientForm(
                  database: database,
                  patient: patient,
                ))),
      ),
    );
  }
}

class _RegisterPatientForm extends StatelessWidget {
  _RegisterPatientForm(
      {Key? key, required this.database, required this.patient})
      : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  ProodontoDatabase database;
  Patient patient;
  ValueNotifier<String> sexValueNotifier = ValueNotifier(sexStringList[0]);
  ValueNotifier<String> skinColorValueNotifier =
      ValueNotifier(skinColorStringList[0]);
  ValueNotifier<String> maritalStatusValueNotifier =
      ValueNotifier(maritalStatusStringList[0]);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _RegisterPatientTextField(name: "name", label: "Nome"),
          DropdownButtonSelector(
            list: sexStringList,
            valueNotifier: sexValueNotifier,
            hint: 'Escolha seu sexo',
          ),
          const _RegisterPatientTextField(
              name: "cpf", label: "CPF", hint: "000.000.000-01"),
          const _RegisterPatientTextField(
              name: "rg", label: "RG", hint: "1.000.111"),
          const _RegisterPatientTextField(
              name: "issuingAgency", label: "Orgão expedidor"),
          DropdownButtonSelector(
            list: skinColorStringList,
            hint: 'Escolha sua cor de pele',
            valueNotifier: skinColorValueNotifier,
          ),
          const _RegisterPatientTextField(
              name: "birthday",
              label: "Data de nascimento",
              hint: "01/12/2000"),
          const _RegisterPatientTextField(
            name: "fixNumber",
            label: "Telefone",
            hint: "3333-3333",
          ),
          const _RegisterPatientTextField(name: "phone", label: "Celular"),
          const _RegisterPatientTextField(
            name: "email",
            label: "email",
          ),
          const _RegisterPatientTextField(name: "address", label: "Endereço"),
          const _RegisterPatientTextField(
              name: "addressComplement", label: "Complemento"),
          const _RegisterPatientTextField(name: "cep", label: "CEP"),
          const _RegisterPatientTextField(
              name: "neighborhood", label: "Bairro"),
          const _RegisterPatientTextField(
              name: "placeOfBirth", label: "Naturalidade"),
          const _RegisterPatientTextField(
              name: "nationality", label: "Nacionalidade"),
          DropdownButtonSelector(
            list: maritalStatusStringList,
            hint: 'Escolha seu estado civil',
            valueNotifier: maritalStatusValueNotifier,
          ),
          const _RegisterPatientTextField(
            name: "profession",
            label: "Profissão",
          ),
          const _RegisterPatientTextField(
              name: "workAddress", label: "Endereço da profissão"),
          ElevatedButton(
            onPressed: () {
              addFieldsToPatientMap();
              _finishRegister(context, patient);
            },
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text("Próximo"),
          ),
        ],
      ),
    );
  }

  void addFieldsToPatientMap() {
    var fields = _formKey.currentState?.fields;
    patient.name = fields!["name"]?.value;
    patient.cpf = fields["cpf"]?.value;
    patient.rg = fields["rg"]?.value;
    patient.issuingAgency = fields["issuingAgency"]?.value;
    patient.birthday = fields["birthday"]?.value;
    patient.fixNumber = fields["fixNumber"]?.value;
    patient.phone = fields["phone"]?.value;
    patient.email = fields["email"]?.value;
    patient.address = fields["address"]?.value;
    patient.addressComplement = fields["addressComplement"]?.value;
    patient.neighborhood = fields["neighborhood"]?.value;
    patient.cep = fields["cep"]?.value;
    patient.placeOfBirth = fields["placeOfBirth"]?.value;
    patient.nationality = fields["nationality"]?.value;
    patient.profession = fields["profession"]?.value;
    patient.workAddress = fields["workAddress"]?.value;
    patient.sex = Sex.values[sexStringList.indexOf(sexValueNotifier.value)];
    patient.maritalStatus= MaritalStatus.values[maritalStatusStringList.indexOf(maritalStatusValueNotifier.value)];
    patient.skinColor = SkinColor.values[skinColorStringList.indexOf(skinColorValueNotifier.value)];
  }

  void _finishRegister(BuildContext context, Patient patientMap) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterPatientResponsible(
                  database: database,
                  patient: patient,
                )));
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
