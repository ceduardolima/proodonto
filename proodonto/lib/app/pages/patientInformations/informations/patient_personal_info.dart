import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../database/database.dart';
import '../../../database/entity/patient.dart';
import '../../../shared/editable_date_picker.dart';
import '../../../shared/editable_dropdown_field.dart';
import '../../../shared/editable_text_field.dart';
import '../../../shared/enum_types.dart';

class PatientInformationData extends StatefulWidget {
  PatientInformationData(
      {super.key, required this.patient, required this.database});

  final Patient patient;
  final ProodontoDatabase database;

  @override
  State<PatientInformationData> createState() => _PatientInformationDataState();
}

class _PatientInformationDataState extends State<PatientInformationData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditableTextField(
          label: "Nome",
          initialValue: widget.patient.name!,
          submit: (changedValue) {
            setState(() {
              widget.patient.name = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Email",
          initialValue: widget.patient.email!,
          submit: (changedValue) {
            setState(() {
              widget.patient.email = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Telefone fixo",
          initialValue: widget.patient.fixNumber!,
          submit: (changedValue) {
            setState(() {
              widget.patient.fixNumber = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Telefone celular",
          initialValue: widget.patient.phone!,
          submit: (changedValue) {
            setState(() {
              widget.patient.phone = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "cpf",
          initialValue: widget.patient.cpf!,
          submit: (changedValue) {
            setState(() {
              widget.patient.cpf = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Orgão expedidor",
          initialValue: widget.patient.issuingAgency!,
          submit: (changedValue) {
            setState(() {
              widget.patient.issuingAgency = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        Row(
          children: [
            Expanded(
              child: EditableDropdownField(
                label: "Sexo",
                initialValue: Sex.getNameList()[widget.patient.sex!.index],
                list: Sex.getNameList(),
                onSubmit: (changedValue) {
                  int index = Sex.getNameList().indexOf(changedValue);
                  widget.patient.sex = Sex.values[index];
                  widget.database.patientDao.update(widget.patient);
                },
              ),
            ),
            Container(
              width: 20,
            ),
            Expanded(
              child: EditableDropdownField(
                label: "Cor da Pele",
                initialValue:
                    SkinColor.getNameList()[widget.patient.skinColor!.index],
                list: SkinColor.getNameList(),
                onSubmit: (changedValue) {
                  int index = SkinColor.getNameList().indexOf(changedValue);
                  widget.patient.skinColor = SkinColor.values[index];
                  widget.database.patientDao.update(widget.patient);
                },
              ),
            ),
          ],
        ),
        EditableDatePicker(
          label: "Aniversário",
          date: widget.patient.birthday!,
          submit: (date) {
            DateTime selectedDate = DateFormat("dd/MM/yyyy").parse(date);
            String dateInUTCFormat = selectedDate.toUtc().toString();
            debugPrint("Date: ${dateInUTCFormat}");
            widget.patient.birthday = dateInUTCFormat;
            widget.database.patientDao.update(widget.patient);
          },
        ),
        EditableTextField(
          label: "Naturalidade",
          initialValue: widget.patient.placeOfBirth!,
          submit: (changedValue) {
            setState(() {
              widget.patient.placeOfBirth = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Nacionalidade",
          initialValue: widget.patient.nationality!,
          submit: (changedValue) {
            setState(() {
              widget.patient.nationality = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Endereço",
          initialValue: widget.patient.address!,
          submit: (changedValue) {
            setState(() {
              widget.patient.address = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Bairro",
          initialValue: widget.patient.neighborhood!,
          submit: (changedValue) {
            setState(() {
              widget.patient.neighborhood = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Complemento",
          initialValue: widget.patient.addressComplement!,
          submit: (changedValue) {
            setState(() {
              widget.patient.addressComplement = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "CEP",
          initialValue: widget.patient.cep!,
          submit: (changedValue) {
            setState(() {
              widget.patient.cep = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Profissão",
          initialValue: widget.patient.profession!,
          submit: (changedValue) {
            setState(() {
              widget.patient.profession = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Edereço do trabalho",
          initialValue: widget.patient.workAddress!,
          submit: (changedValue) {
            setState(() {
              widget.patient.workAddress = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Responsável",
          initialValue: widget.patient.responsibleName,
          submit: (changedValue) {
            setState(() {
              widget.patient.responsibleName = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Relação parental",
          initialValue: widget.patient.parentalRelationship,
          submit: (changedValue) {
            setState(() {
              widget.patient.parentalRelationship = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Endereço do responsável",
          initialValue: widget.patient.responsibleAddress,
          submit: (changedValue) {
            setState(() {
              widget.patient.responsibleAddress = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "N. do telefone do responsável",
          initialValue: widget.patient.responsiblePhoneNumber,
          submit: (changedValue) {
            setState(() {
              widget.patient.responsiblePhoneNumber = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "RG do responsável",
          initialValue: widget.patient.responsibleRG,
          submit: (changedValue) {
            setState(() {
              widget.patient.responsibleRG = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
        EditableTextField(
          label: "Orgão expedidor do responsável",
          initialValue: widget.patient.responsibleIssuingAgency,
          submit: (changedValue) {
            setState(() {
              widget.patient.responsibleIssuingAgency = changedValue;
              widget.database.patientDao.update(widget.patient);
            });
          },
        ),
      ],
    );
  }
}
