import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'default_size.dart';

class DefaultFormField extends StatelessWidget {
  DefaultFormField(
      {required this.name,
        required this.label,
        this.hint,
        Key? key,
        this.inputType,
        this.maxLength,
        this.errorMessenger})
      : super(key: key);

  final String name;
  final String? hint;
  final String label;
  final int? maxLength;
  final TextInputType? inputType;
  String? errorMessenger;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderTextField(
        name: name,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label, hintText: hint,),
        maxLines: 1,
        maxLength: maxLength,
        validator: (value) => _validate(value),
      ),
    );
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessenger ?? "Campo obrigatório";
    }
    return null;
  }
}
