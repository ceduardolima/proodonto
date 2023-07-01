import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/shared/default_size.dart';

class DefaultRadioButton extends StatelessWidget {
  DefaultRadioButton({Key? key, required this.name, required this.label})
      : super(key: key);
  final String name;
  final String label;
  final options = [
    const FormBuilderFieldOption(value: true, child: Text("Sim")),
    const FormBuilderFieldOption(
      value: false,
      child: Text("Não"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderRadioGroup(
        name: name,
        options: options,
        initialValue: false,
        decoration: InputDecoration(labelText: label, helperText: ""),

      ),
    );
  }
}
