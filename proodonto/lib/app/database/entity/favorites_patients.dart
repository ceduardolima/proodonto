import 'package:floor/floor.dart';

@Entity(tableName: "favorites_patients")
class FavoritePatient {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String patientId;
  FavoritePatient(this.patientId);
}
