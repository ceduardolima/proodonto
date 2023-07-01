import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/shared/default_size.dart';

class FormFieldDateTime extends StatelessWidget {
  FormFieldDateTime(
      {super.key, required this.name, required this.label, this.initialDate});

  String? initialDate;
  final String label;
  String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderDateTimePicker(
        name: name,
        decoration: InputDecoration(
            labelText:  label,
            helperText: "",
            suffixIcon: const Icon(Icons.date_range)),
        inputType: InputType.date,
        initialDate:
            initialDate == null ? null : DateTime.tryParse(initialDate!),
      ),
    );
  }
}
