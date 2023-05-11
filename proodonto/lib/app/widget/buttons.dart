import 'package:flutter/material.dart';

import '../utils/default_size.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.text, required this.onPressed, this.alignment, this.minimumSize}) : super(key: key);
  final Function onPressed;
  final Alignment? alignment;
  final double? minimumSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.medium),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          alignment: alignment ?? Alignment.center,
          minimumSize: Size.fromHeight(minimumSize ?? 50),
        ),
        child: Text(text),
      ),
    );
  }
}

