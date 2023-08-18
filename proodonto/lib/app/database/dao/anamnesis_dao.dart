import 'package:floor/floor.dart';
import 'package:proodonto/app/database/entity/anamnesis.dart';

@dao
abstract class AnamnesisDao {
  @Query("SELECT * FROM anamnesis")
  Future<List<Anamnesis>> getAll();

  @Query("SELECT * FROM anamnesis WHERE patientCPF=:cpf")
  Future<Anamnesis?>findByCPF(String cpf);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insert(Anamnesis anamnesis);
}