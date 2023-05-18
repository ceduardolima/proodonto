import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DefaultDropdownButton extends StatelessWidget {
  const DefaultDropdownButton(
      {super.key,
      required this.list,
      required this.label,
      required this.name, this.initialValue});

  final String name;
  final List<String> list;
  final String? label;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: name,
      initialValue: initialValue,
      decoration: InputDecoration(labelText: label),
      validator: FormBuilderValidators.required(errorText: "Campo obrigatório"),
      items: list
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
    );
  }
}
