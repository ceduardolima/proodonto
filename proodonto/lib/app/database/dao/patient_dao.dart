import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/patient.dart';

@dao
abstract class PatientDao {

  @Query("SELECT * FROM Patient")
  Future<List<Patient>> getAll();

  @Query("SELECT * FROM Patient WHERE id=:id")
  Stream<Patient?> findById(int id);

  @Query("SELECT * FROM Patient WHERE cpf=:cpf")
  Stream<Patient?> findByCPF(String cpf);

  @Query("SELECT * FROM Patient WHERE name like :name")
  Stream<List<Patient>?> findByName(String name);

  @Insert()
  Future<void> insert(Patient patient);

  @Query("DELETE FROM patient WHERE cpf=:cpf")
  Future<void> deletePatientByCPF(String cpf);
}