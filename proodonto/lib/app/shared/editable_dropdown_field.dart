
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:proodonto/app/shared/default_size.dart';

class EditableDropdownField extends StatefulWidget {
  EditableDropdownField(
      {super.key, required this.list, required this.label, this.initialValue, required this.onSubmit});

  final List<String> list;
  final String label;
  final String? initialValue;
  final Function(String) onSubmit;

  @override
  State<EditableDropdownField> createState() => _EditableDropdownFieldState();
}

class _EditableDropdownFieldState extends State<EditableDropdownField> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.medium),
      child: Stack(
          textDirection: TextDirection.rtl,
          alignment: AlignmentDirectional.centerStart,
          children: [
            FormBuilderDropdown<String>(
              name: "",
              onChanged: (changedValue) {
                setState(() {
                  widget.onSubmit(changedValue!);
                  edit = false;
                });
              },
              initialValue: widget.initialValue,
              enabled: edit,
              iconDisabledColor: Colors.transparent,
              items: widget.list
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              validator: FormBuilderValidators.required(
                  errorText: "Campo obrigatório"),
              decoration: InputDecoration(
                  label: Text(
                    widget.label,
                    overflow: TextOverflow.ellipsis,
                  )),
            ),
            if (!edit)
              IconButton(onPressed: () {
                setState(() {
                  edit = true;
                });
              },
                icon: const Icon(Icons.edit),
              )
          ]),
    );
  }
}
