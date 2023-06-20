import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/database/entity/exam.dart';
import 'package:proodonto/app/interfaces/form_abstraction.dart';
import 'package:proodonto/app/shared/default_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';
import 'package:proodonto/app/shared/enum_types.dart';

class ExamBasicInfoStep extends RegisterForm {
  ExamBasicInfoStep({Key? key, required this.exam}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final Exam exam;

  @override
  getFields(field) {
    _formKey.currentState!.save();
    final fields = _formKey.currentState!.fields;
    field.patientCPF = fields["patientCPF"]!.value;
    field.generalType = GeneralType.values[
        GeneralType.getNameList().indexOf(fields["generalType"]!.value)];
    field.weight = fields["weight"]!.value;
    field.height = fields["height"]!.value;
    field.temperature = fields["temperature"]!.value;
    field.othersObservations = fields["othersObservations"]!.value;
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
              name: "patientCPF",
              label: "CPF do paciênte",
              length: 11,
              inputType: TextInputType.number,
              initialValue: exam.patientCPF,
            ),
            DefaultDropdownButton(
              name: "skinColor",
              label: "Cor da pele",
              list: SkinColor.getNameList(),
              initialValue: SkinColor.getNameList()[0],
            ),
            DefaultFormField(
              name: "weight",
              label: "Peso",
              inputType: TextInputType.number,
              initialValue: exam.weight,
            ),
            DefaultFormField(
              name: "height",
              label: "altura",
              inputType: TextInputType.number,
              initialValue: exam.height,
            ),
            DefaultFormField(
              name: "temperature",
              label: "Temperatura",
              inputType: TextInputType.number,
              initialValue: exam.temperature,
            ),
            DefaultDropdownButton(
              name: "generalType",
              label: "Tipo Geral",
              list: GeneralType.getNameList(),
              initialValue: GeneralType.getNameList()[0],
            ),
            DefaultFormField(
              name: "othersObservations",
              label: "Outras observações",
              initialValue: exam.othersObservations,
            ),
          ],
        ),
      ),
    );
  }
}
