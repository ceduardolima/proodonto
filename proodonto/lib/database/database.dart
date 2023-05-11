import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../utils/enum_types.dart';
import 'dao/patient_dao.dart';
import 'entity/patient.dart';


part 'database.g.dart';

@Database(version: 1, entities: [Patient])
abstract class ProodontoDB extends FloorDatabase {
  PatientDao get patientDao;
}