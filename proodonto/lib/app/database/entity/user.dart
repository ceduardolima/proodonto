import 'package:floor/floor.dart';
import 'package:proodonto/app/shared/enum_types.dart';

class User {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  String? birthday;
  Sex? sex;
  String? cpf;
  String? rg;
  String? issuingAgency;
  String? cep;
  String? address;
  String? neighborhood;
  String? addressComplement;
  SkinColor? skinColor;
  String? fixNumber;
  String? phone;
  String? placeOfBirth;
  String? nationality;
  MaritalStatus? maritalStatus;

  User({
      this.id,
      this.name,
      this.birthday,
      this.sex,
      this.cpf,
      this.rg,
      this.issuingAgency,
      this.cep,
      this.address,
      this.neighborhood,
      this.addressComplement,
      this.skinColor,
      this.fixNumber,
      this.phone,
      this.placeOfBirth,
      this.nationality,
      this.maritalStatus});
}
