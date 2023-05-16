import 'dart:core';

import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/user.dart';

@Entity(tableName: "patient")
class Patient extends User {
  int? recordNumber;
  String? advisor;
  String? semester;
  String? careUnit;
  String? profession;
  String? workAddress;
  String? email;
  String? initialExam;
  String? responsibleName;
  String? responsibleAddress;
  String? responsibleRG;
  String? responsibleIssuingAgency;
  String? parentalRelationship;
  String? responsiblePhoneNumber;

  Patient(
      {this.recordNumber,
      this.advisor,
      this.semester,
      this.careUnit,
      this.profession,
      this.workAddress,
      this.email,
      this.initialExam,
      this.responsibleName,
      this.responsibleAddress,
      this.responsibleRG,
      this.responsibleIssuingAgency,
      this.parentalRelationship,
      this.responsiblePhoneNumber,
      super.id,
      super.name,
      super.birthday,
      super.sex,
      super.cpf,
      super.rg,
      super.issuingAgency,
      super.cep,
      super.address,
      super.neighborhood,
      super.addressComplement,
      super.skinColor,
      super.fixNumber,
      super.phone,
      super.placeOfBirth,
      super.nationality,
      super.maritalStatus});
}
