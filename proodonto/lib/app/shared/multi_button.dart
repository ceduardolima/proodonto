import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:proodonto/app/shared/default_radio_form_field.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:proodonto/app/shared/dropdown_button.dart';

class MultiButton extends StatefulWidget {
  const MultiButton({
    super.key,
    required this.name,
    required this.label,
    required this.children,
  });

  final String name;
  final String label;
  final List<Widget> children;

  @override
  State<MultiButton> createState() => _MultiButtonState();
}

class _MultiButtonState extends State<MultiButton> {
  final options = [
    const FormBuilderFieldOption(value: true, child: Text("Sim")),
    const FormBuilderFieldOption(
      value: false,
      child: Text("Não"),
    )
  ];
  bool currentOption = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        children: [
          FormBuilderRadioGroup(
            name: widget.name,
            options: options,
            initialValue: currentOption,
            decoration: InputDecoration(labelText: widget.label, helperText: ""),
            onChanged: (value) {
              setState(() {
                currentOption = !currentOption;
              });
            },
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            firstChild: Container(),  // When you don't want to show menu..
            secondChild: Column(
              children: widget.children,
            ),
            crossFadeState: !currentOption ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          )
        ],
      ),
    );
  }
}
