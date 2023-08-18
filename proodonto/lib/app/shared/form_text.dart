import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/shared/default_size.dart';

class FormText extends StatelessWidget {
  const FormText({
    super.key,
    required this.label,
    required this.value,
    this.suffix,
  });

  final String label;
  final dynamic value;
  final String? suffix;

  String getValue() {
    if (value == null) {
      return "Não consta";
    } else if (value is bool) {
      if (value) {
        return "Sim";
      } else {
        return "Não";
      }
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: PaddingSize.medium),
        child: FormBuilderTextField(
          name: "",
          enabled: false,
          initialValue: getValue(),
          decoration: InputDecoration(
            label: Text(label),
            suffixText: suffix,
          ),
        ));
  }
}
