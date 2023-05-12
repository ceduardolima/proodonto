import 'package:floor/floor.dart';
import 'package:proodonto/app/shared/enum_types.dart';

class User {
  @PrimaryKey(autoGenerate: true)
  final int? id;
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
      {this.id,
      required this.name,
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
