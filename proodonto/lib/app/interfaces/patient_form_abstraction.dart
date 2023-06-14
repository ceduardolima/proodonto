import 'package:flutter/cupertino.dart';
import 'package:proodonto/app/database/entity/patient.dart';

abstract class PatientForm extends StatelessWidget {
  const PatientForm({super.key});

  Patient getFields(Patient patient);
  bool validate();
}