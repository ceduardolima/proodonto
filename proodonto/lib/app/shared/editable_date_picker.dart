import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/editable_text_field.dart';
import 'dart:ui' as ui;

class EditableDatePicker extends StatefulWidget {
  const EditableDatePicker(
      {super.key, required this.date, required this.label, required this.submit});
  final Function(String) submit;
  final String? date;
  final String label;

  @override
  State<EditableDatePicker> createState() => _EditableDatePickerState();
}

class _EditableDatePickerState extends State<EditableDatePicker> {
  bool edit = false;
  final _controller = TextEditingController();

  DateTime? parse(String? date) {
    if (date == null) {
      return null;
    }
    DateTime dateTime = DateTime.parse(date);
    String formattedString = DateFormat("dd/MM/yyyy").format(dateTime);
    return DateFormat("dd/MM/yyyy").parse(formattedString);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.medium),
      child: Stack(
          textDirection: ui.TextDirection.rtl,
          alignment: AlignmentDirectional.centerStart,
          children: [
            FormBuilderDateTimePicker(
              controller: _controller,
              name: "",
              enabled: edit,
              format: DateFormat("dd/MM/yyyy"),
              initialEntryMode: DatePickerEntryMode.input,
              inputType: InputType.date,
              initialValue: widget.date == null ? parse("") : parse(widget.date!),
              decoration:
              InputDecoration(labelText: widget.label),
            ),
            IconEditButton(
              edit: edit,
              changeEditState: (editable) => setState((){
                edit = editable;
              }),
              onSubmit: () {
                widget.submit(_controller.text);
              },
            )
          ]),
    );
  }
}