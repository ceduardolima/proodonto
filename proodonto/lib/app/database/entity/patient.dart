import 'dart:core';
import 'dart:core';

import 'package:floor/floor.dart';

import '../../utils/enum_types.dart';

@Entity(tableName: "patient")
class Patient extends User {
  @PrimaryKey(autoGenerate: true)
  int id = 0;
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
      {required this.id,
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
}

class User {
  final String name;
  final String birthday;
  final Sex sex;
  final String cpf;
  final String rg;
  final String issuingAgency;
  final String cep;
  final String address;
  final String neighborhood;
  final String addressComplement;
  final SkinColor skinColor;
  final String fixNumber;
  final String phone;
  final String placeOfBirth;
  final String nationality;
  final MaritalStatus maritalStatus;

  User(
      {required this.name,
      required this.birthday,
      required this.sex,
      required this.cpf,
      required this.rg,
      required this.issuingAgency,
      required this.cep,
      required this.address,
      required this.neighborhood,
      required this.addressComplement,
      required this.skinColor,
      required this.fixNumber,
      required this.phone,
      required this.placeOfBirth,
      required this.nationality,
      required this.maritalStatus});
}
