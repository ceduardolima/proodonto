import 'dart:async';
import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:proodonto/app/shared/enum_types.dart';
import 'dao/patient_dao.dart';
import 'dart:core';

part 'database.g.dart';

@Database(version: 1, entities: [Patient])
abstract class ProodontoDatabase extends FloorDatabase {
  PatientDao get patientDao;
}