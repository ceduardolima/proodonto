import 'package:flutter/material.dart';

class DropdownButtonSelector extends StatefulWidget {
  const DropdownButtonSelector({super.key,
    required this.list,
    required this.hint,
    required this.valueNotifier});

  final List<String> list;
  final String hint;
  final ValueNotifier<String> valueNotifier;

  @override
  State<DropdownButtonSelector> createState() =>
      _DropdownButtonExampleState(list, hint, valueNotifier);
}

class _DropdownButtonExampleState extends State<DropdownButtonSelector> {
  _DropdownButtonExampleState(this.list, this.hint,
      this.valueNotifier) {
    dropdownValue = list.first;
  }

  final ValueNotifier<String> valueNotifier;
  final String hint;
  late String dropdownValue;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (BuildContext context, String value, Widget? child) {
        return DropdownButton<String>(
          hint: Text(hint),
          value: (value.isEmpty) ? null : value,
          onChanged: (String? value) => valueNotifier.value = value.toString(),
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
