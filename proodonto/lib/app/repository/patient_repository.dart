import 'package:floor/floor.dart';
import 'package:proodonto/app/database/dao/patient_dao.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/database/entity/patient.dart';

class PatientRepository {
  final ProodontoDatabase _database;
  late final PatientDao dao;
  PatientRepository(this._database) {
    dao = _database.patientDao;
  }

  Future<void> insert(Patient patient) async {
    dao.insert(patient);
  }

  Future<List<Patient>> getAll() {
    return dao.getAll();
  }
}