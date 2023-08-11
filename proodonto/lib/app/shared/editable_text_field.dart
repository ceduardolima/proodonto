import 'package:flutter/material.dart';
import 'package:proodonto/app/shared/default_size.dart';

class EditableTextField extends StatefulWidget {
  EditableTextField(
      {super.key,
      required this.submit,
      this.initialValue,
      required this.label});

  final Function(String) submit;
  String? initialValue;
  final String label;

  @override
  State<EditableTextField> createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  bool edit = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.initialValue != null) {
        _controller.text = widget.initialValue!;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeEditState(bool editable) => setState(() {
        edit = editable;
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.medium),
      child: Stack(
          textDirection: TextDirection.rtl,
          alignment: AlignmentDirectional.centerStart,
          children: [
            TextField(
              readOnly: !edit,
              enabled: edit,
              controller: _controller,
              decoration: InputDecoration(
                labelText: widget.label,
                enabled: edit,
              ),
            ),
            IconEditButton(
              edit: edit,
              changeEditState: changeEditState,
              onSubmit: () {
                String changedValue = _controller.text;
                widget.submit(changedValue);
              },
            )
          ]),
    );
  }
}

class IconEditButton extends StatelessWidget {
  IconEditButton({
    super.key,
    required this.edit,
    required this.changeEditState,
    required this.onSubmit,
  });

  bool edit;
  final Function(bool) changeEditState;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: edit ? 100 : 50,
        child: edit
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        onSubmit();
                        changeEditState(false);
                      },
                      icon: const Icon(Icons.check)),
                  IconButton(
                      onPressed: () => changeEditState(false),
                      icon: const Icon(Icons.close)),
                ],
              )
            : IconButton(
                onPressed: () => changeEditState(true),
                icon: const Icon(Icons.edit)));
  }
}
