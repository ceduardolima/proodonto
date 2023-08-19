import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/favorites_patients.dart';

@dao
abstract class FavoritePatientDao {

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insert(FavoritePatient patient);
  
  @Query("SELECT * FROM favorites_patients")
  Future<List<FavoritePatient>> getFavorites();

  @Query("DELETE FROM favorites_patients WHERE patientId=:id")
  Future<void> delete(String id);
}