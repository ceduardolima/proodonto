import 'dart:core';

import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/user.dart';

@Entity(tableName: "patient")
class Patient extends User {
  final int recordNumber;
  final String advisor;
  final String semester;
  final String careUnit;
  final String profession;
  final String workAddress;
  final String email;
  final String initialExam;
  final String responsibleName;
  final String responsibleRG;
  final String responsibleIssuingAgency;
  final String parentalRelationship;
  final String responsiblePhoneNumber;

  Patient(
      {super.id,
      required this.recordNumber,
      required this.advisor,
      required this.semester,
      required this.careUnit,
      required this.profession,
      required this.workAddress,
      required this.email,
      required this.initialExam,
      required this.responsibleName,
      required this.responsibleRG,
      required this.responsibleIssuingAgency,
      required this.parentalRelationship,
      required this.responsiblePhoneNumber,
      required super.name,
      required super.birthday,
      required super.sex,
      required super.cpf,
      required super.rg,
      required super.issuingAgency,
      required super.cep,
      required super.address,
      required super.neighborhood,
      required super.addressComplement,
      required super.skinColor,
      required super.fixNumber,
      required super.phone,
      required super.placeOfBirth,
      required super.nationality,
      required super.maritalStatus});

  static Patient mapToPatientBuilder(Map patientMap) {
    return Patient(
        recordNumber: patientMap["recordNumber"],
        advisor: patientMap["advisor"],
        semester: patientMap["semester"],
        careUnit: patientMap["careUnit"],
        profession: patientMap["profession"],
        workAddress: patientMap["patientworkAddress"],
        email: patientMap["email"],
        initialExam: patientMap["initialExam"],
        responsibleName: patientMap["responsibleName"],
        responsibleRG: patientMap["responsibleRG"],
        responsibleIssuingAgency: patientMap["responsibleIssuingAgency"],
        parentalRelationship: patientMap["parentalRelationship"],
        responsiblePhoneNumber: patientMap["responsiblePhoneNumber"],
        name: patientMap["name"],
        birthday: patientMap["birthday"],
        sex: patientMap["sex"],
        cpf: patientMap["cpf"],
        rg: patientMap["rg"],
        issuingAgency: patientMap["issuingAgency"],
        cep: patientMap["cep"],
        address: patientMap["address"],
        neighborhood: patientMap["neighborhood"],
        addressComplement: patientMap["addressComplement"],
        skinColor: patientMap["skinColor"],
        fixNumber: patientMap["fixNumber"],
        phone: patientMap["phone"],
        placeOfBirth: patientMap["placeOfBirth"],
        nationality: patientMap["nationality"],
        maritalStatus: patientMap["maritalStatus"]);
  }
}
