import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/exam.dart';

@dao
abstract class ExamDao {
  @Query("SELECT * FROM exam")
  Future<List<Exam>> getAll();

  @Query("SELECT * FROM exam WHERE recordNumber=:recordNumber")
  Future<Exam?> findByRecordNumber(int recordNumber);

  @Update()
  Future<void> update(Exam exam);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insert(Exam exam);
}