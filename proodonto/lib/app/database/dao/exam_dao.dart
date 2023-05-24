import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/exam.dart';

@dao
abstract class ExamDao {
  @Query("SELECT * FROM exam")
  Future<List<Exam>> getAll();

  @Query("SELECT * FROM exam WHERE patientCPF=:cpf")
  Stream<List<Exam>> findByCPF(String cpf);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insert(Exam exam);
}