import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/patient.dart';

@dao
abstract class PatientDao {

  @Query("SELECT * FROM patient")
  Future<List<Patient>> getAll();

  @Query("SELECT * FROM patient WHERE id=:id")
  Stream<Patient?> findById(int id);

  @Query("SELECT * FROM patient WHERE cpf=:cpf")
  Stream<Patient?> findByCPF(String cpf);

  @Query("SELECT * FROM patient WHERE name like :name")
  Stream<List<Patient>?> findByName(String name);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insert(Patient patient);

  @Query("DELETE FROM patient WHERE cpf=:cpf")
  Future<void> deletePatientByCPF(String cpf);
}