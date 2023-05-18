import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/patient/register_patient_responsible.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
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
  final ProodontoDatabase database;
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DefaultFormField(
            name: "name",
            label: "Nome",
            initialValue: patient.name,
          ),
          DefaultDropdownButton(
            name: "sex",
            list: sexStringList,
            label: 'Sexo',
          ),
          DefaultFormField(
            name: "cpf",
            label: "CPF",
            hint: "000.000.000-01",
            initialValue: patient.cpf,
            length: 11,
            inputType: TextInputType.number,
          ),
          DefaultFormField(
            name: "rg",
            label: "RG",
            initialValue: patient.rg,
            hint: "1.000.111",
            length: 7,
          ),
          DefaultFormField(
            name: "issuingAgency",
            label: "Orgão expedidor",
            initialValue: patient.issuingAgency,
          ),
          DefaultDropdownButton(
            name: "skinColor",
            list: skinColorStringList,
            label: 'Cor de pele',
          ),
          FormBuilderDateTimePicker(
            name: "birthday",
            decoration: const InputDecoration(labelText: "Aniversário"),
            inputType: InputType.date,
            initialDate: patient.birthday == null
                ? null
                : DateTime.tryParse(patient.birthday!),
          ),
          DefaultFormField(
            name: "fixNumber",
            label: "Telefone",
            hint: "3333-3333",
            initialValue: patient.fixNumber,
            inputType: TextInputType.number,
            length: 8,
          ),
          DefaultFormField(
            name: "phone",
            label: "Celular",
            hint: "81912341234",
            initialValue: patient.phone,
            inputType: TextInputType.number,
            length: 11,
          ),
          DefaultFormField(
            name: "email",
            label: "email",
            initialValue: patient.email,
            inputType: TextInputType.emailAddress,
          ),
          DefaultFormField(
            name: "address",
            label: "Endereço",
            initialValue: patient.address,
          ),
          DefaultFormField(
            name: "addressComplement",
            label: "Complemento",
            initialValue: patient.addressComplement,
          ),
          DefaultFormField(
            name: "cep",
            label: "CEP",
            initialValue: patient.cep,
            length: 8,
            inputType: TextInputType.number,
          ),
          DefaultFormField(
            name: "neighborhood",
            label: "Bairro",
            initialValue: patient.neighborhood,
          ),
          DefaultFormField(
            name: "placeOfBirth",
            label: "Naturalidade",
            initialValue: patient.placeOfBirth ?? "Brasileira",
          ),
          DefaultFormField(
            name: "nationality",
            label: "Nacionalidade",
            initialValue: patient.nationality ?? "Brasileira",
          ),
          DefaultDropdownButton(
            name: "maritalState",
            list: maritalStatusStringList,
            label: 'Estado civil',
          ),
          DefaultFormField(
            name: "profession",
            label: "Profissão",
            initialValue: patient.profession,
          ),
          DefaultFormField(
            name: "workAddress",
            label: "Endereço da profissão",
            initialValue: patient.workAddress,
          ),
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
    patient.birthday = fields["birthday"]?.value.toString();
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
    patient.sex = Sex.values[sexStringList.indexOf(fields["sex"]?.value)];
    patient.maritalStatus = MaritalStatus.values[
        maritalStatusStringList.indexOf(fields["maritalState"]?.value)];
    patient.skinColor = SkinColor
        .values[skinColorStringList.indexOf(fields["skinColor"]?.value)];
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
