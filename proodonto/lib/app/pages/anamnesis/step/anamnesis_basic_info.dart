import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/entity/anamnesis.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';

class AnamnesisBasicInfoStep extends RegisterForm {
  AnamnesisBasicInfoStep({Key? key, required this.anamnesis}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final Anamnesis anamnesis;

  @override
  getFields(field) {
    _formKey.currentState!.save();
    final fields = _formKey.currentState!.fields;
    field.recordNumber = int.parse(fields["recordNumber"]!.value);
  }

  @override
  bool validate() {
    final values = _formKey.currentState?.fields.values.toList();
    bool isValid = true;
    values?.forEach((element) {
      element.validate();
      if (!element.isValid) {
        isValid = false;
      }
    });
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSize.small),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            DefaultFormField(
              name: "recordNumber",
              label: "Número do prontuário",
              inputType: TextInputType.number,
              initialValue: anamnesis.recordNumber != null ? anamnesis.recordNumber.toString() : "",
              required: true,
            ),
          ],
        ),
      ),
    );
  }
}
