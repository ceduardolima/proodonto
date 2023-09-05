import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/shared/default_size.dart';

class DefaultRadioGroup extends StatelessWidget {
  DefaultRadioGroup({
    super.key,
    required this.name,
    required this.options, required this.label,
  }) {
    formOptions = _buildFormOptions();
  }

  final String name;
  final String label;
  final List<String> options;
  late List<FormBuilderFieldOption<String>> formOptions;

  List<FormBuilderFieldOption<String>> _buildFormOptions() {
    List<FormBuilderFieldOption<String>> buffer = [];
    for (String option in options) {
      buffer.add(FormBuilderFieldOption(
        value: option,
        child: Text("$option"),
      ));
    }
    return buffer;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.small),
      child: FormBuilderCheckboxGroup(
        name: name,
        options: formOptions,
        wrapDirection: Axis.vertical,
        wrapVerticalDirection: VerticalDirection.down,
        orientation: OptionsOrientation.vertical,
        decoration: InputDecoration(
          labelText: label,
          helperText: ""
        ),
      ),
    );
  }
}
