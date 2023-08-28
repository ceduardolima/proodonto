import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'default_size.dart';

class DefaultFormField extends StatelessWidget {
  DefaultFormField({
    required this.name,
    required this.label,
    this.hint,
    Key? key,
    this.inputType,
    this.length,
    this.requireErrorMessenger,
    this.initialValue,
    this.suffixText,
    this.required = false,
  }) : super(key: key);

  final String name;
  final String? hint;
  final String label;
  final int? length;
  final TextInputType? inputType;
  final String? suffixText;
  final String? initialValue;
  final bool required;
  String? requireErrorMessenger;
  String? minLengthErrorMessenger = "Campo incompleto";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderTextField(
        name: name,
        keyboardType: inputType,
        initialValue: initialValue,
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            helperText: "",
            suffixText: suffixText),
        maxLines: 1,
        maxLength: length,
        validator: FormBuilderValidators.compose(
          [
            if (length != null && required)
              FormBuilderValidators.equalLength(
                length!,
                errorText: requireErrorMessenger ?? "Dado incompleto",
              ),
            if (required)
              FormBuilderValidators.required(
                errorText: requireErrorMessenger ?? "Campo Obrigatório",
              )
          ],
        ),
      ),
    );
  }
}
