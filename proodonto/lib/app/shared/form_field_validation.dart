import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

bool validateItems(GlobalKey<FormBuilderState> key) {
  final values = key.currentState?.fields.values.toList();
  bool isValid = true;
  values?.forEach((element) {
    element.validate();
    if (!element.isValid) {
      isValid = false;
    }
  });
  return isValid;
}