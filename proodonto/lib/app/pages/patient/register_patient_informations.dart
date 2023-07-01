import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';
import 'package:proodonto/app/shared/form_field_date_time.dart';

import '../../database/entity/patient.dart';

class RegisterPatientForm extends RegisterForm {
  RegisterPatientForm(
      {Key? key, required this.patient})
      : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
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
            list: Sex.getNameList(),
            initialValue:
                patient.sex != null ? Sex.getValueByName(patient.sex!) : null,
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
            list: SkinColor.getNameList(),
            initialValue: patient.skinColor != null
                ? SkinColor.getValueByName(patient.skinColor!)
                : null,
            label: 'Cor de pele',
          ),
          FormFieldDateTime(
            name: "birthday",
            label: "Aniversário",
            initialDate: patient.birthday
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
            list: MaritalStatus.getNameList(),
            initialValue: patient.maritalStatus != null
                ? MaritalStatus.getValueByName(patient.maritalStatus!)
                : null,
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
        ],
      ),
    );
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
  dynamic getFields(dynamic field) {
    final fields = _formKey.currentState?.fields;
    field.name = fields!["name"]?.value;
    field.cpf = fields["cpf"]?.value;
    field.rg = fields["rg"]?.value;
    field.issuingAgency = fields["issuingAgency"]?.value;
    field.birthday = fields["birthday"]?.value.toString();
    field.fixNumber = fields["fixNumber"]?.value;
    field.phone = fields["phone"]?.value;
    field.email = fields["email"]?.value;
    field.address = fields["address"]?.value;
    field.addressComplement = fields["addressComplement"]?.value;
    field.neighborhood = fields["neighborhood"]?.value;
    field.cep = fields["cep"]?.value;
    field.placeOfBirth = fields["placeOfBirth"]?.value;
    field.nationality = fields["nationality"]?.value;
    field.profession = fields["profession"]?.value;
    field.workAddress = fields["workAddress"]?.value;
    field.sex = Sex.values[Sex.getNameList().indexOf(fields["sex"]?.value)];
    field.maritalStatus = MaritalStatus.values[
        MaritalStatus.getNameList().indexOf(fields["maritalState"]?.value)];
    field.skinColor = SkinColor
        .values[SkinColor.getNameList().indexOf(fields["skinColor"]?.value)];
    return field;
  }
}
