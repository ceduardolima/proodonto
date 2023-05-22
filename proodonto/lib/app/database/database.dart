import 'dart:async';
import 'package:floor/floor.dart';
import 'package:proodonto/app/database/dao/triage_dao.dart';
import 'package:proodonto/app/database/entity/patient.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:proodonto/app/shared/enum_types.dart';
import 'dao/patient_dao.dart';
import 'dart:core';

import 'entity/triage.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Patient, Triage])
abstract class ProodontoDatabase extends FloorDatabase {
  PatientDao get patientDao;
  TriageDao get triageDao;
}