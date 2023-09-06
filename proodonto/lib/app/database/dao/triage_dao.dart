import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/triage.dart';

@dao
abstract class TriageDao {

  @Query("SELECT * FROM triage")
  Future<List<Triage>> getAll();

  @Query("SELECT * FROM triage WHERE id=:id")
  Stream<Triage?> findById(int id);

  @Query("SELECT * FROM triage WHERE recordNumber=:recordNumber")
  Future<Triage?> findByRecordNumber(int recordNumber);

  @Query("SELECT * FROM triage WHERE patientCPF=:cpf")
  Future<Triage?> findByPatientCPF(String cpf);

  @Query("SELECT * FROM triage WHERE operatorCPF=:cpf")
  Stream<List<Triage?>> findByOperatorCPF(String cpf);

  @Update()
  Future<void> update(Triage triage);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insert(Triage triage);

  @Query("DELETE FROM triage WHERE id=:id")
  Future<void> deletePatientByCPF(int id);
}