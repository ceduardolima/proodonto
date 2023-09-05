import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:proodonto/app/shared/default_size.dart';

class FormFieldDateTime extends StatelessWidget {
  FormFieldDateTime(
      {super.key, required this.name, required this.label, this.initialDate});

  String? initialDate;
  final String label;
  String name;

  DateTime parse(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedString = DateFormat("dd/MM/yyyy").format(dateTime);
    return DateFormat("dd/MM/yyyy").parse(formattedString);
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderDateTimePicker(
        name: name,
        format: DateFormat("dd/MM/yyyy"),
        decoration: InputDecoration(
            labelText:  label,
            helperText: "",
            suffixIcon: const Icon(Icons.date_range)),
        inputType: InputType.date,
        initialDate:
            initialDate == null ? null : parse(initialDate!),
      ),
    );
  }
}
