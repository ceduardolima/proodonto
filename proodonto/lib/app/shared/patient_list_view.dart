
import 'package:flutter/cupertino.dart';

import '../database/database.dart';
import '../database/entity/favorites_patients.dart';
import '../database/entity/patient.dart';
import '../pages/home/patient_item_list.dart';

class PatientListView extends StatelessWidget {
  const PatientListView({
    super.key,
    required this.database,
    required this.patientList,
    required this.onItemTap,
    required this.onFavButtonTap,
  });

  final ProodontoDatabase database;
  final List<Patient?> patientList;
  final Function(Patient) onItemTap;
  final Function onFavButtonTap;
  static const double _verticalPadding = 10.0;

  Future<void> _favButton(Patient patient) async {
    if (patient.isFavorite!) {
      database.favoritesPatientsDao.delete(patient.id!);
    } else {
      database.favoritesPatientsDao.insert(FavoritePatient(patient.id!));
    }
    patient.isFavorite = !patient.isFavorite!;
    await database.patientDao.update(patient);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: patientList.length,
      itemBuilder: (context, index) {
        Patient currentPatient = patientList[index]!;
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: _verticalPadding,
          ),
          child: PatientItem(
            patient: currentPatient,
            onTap: (patient) {
              onItemTap(patient);
            },
            onTapFavoriteButton: () async {
              await _favButton(currentPatient);
              onFavButtonTap();
            },
          ),
        );
      },
    );
  }
}
