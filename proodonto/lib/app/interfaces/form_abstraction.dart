import 'package:flutter/cupertino.dart';
import 'package:proodonto/app/database/entity/patient.dart';

abstract class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  Patient getFields(Patient patient);
  bool validate();
}