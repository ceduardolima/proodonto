import 'package:flutter/material.dart';
import 'package:proodonto/app/theme/colors.dart';

class ChangeVisibilityIconButton extends StatefulWidget {
  const ChangeVisibilityIconButton(
      {super.key, required this.text, required this.child});

  final String text;
  final Widget child;

  @override
  State<ChangeVisibilityIconButton> createState() =>
      _ChangeVisibilityIconButtonState();
}

class _ChangeVisibilityIconButtonState
    extends State<ChangeVisibilityIconButton> {
  final double _iconScale = 2.8;
  final String _iconPath = "assets/icons/minus.png";
  bool _visibility = false;

  Widget getMinusIcon() => Image.asset(_iconPath, scale: _iconScale, color: ProodontoColors.ternary,);

  void changeVisibility() => setState(() {
        debugPrint("Change visibility: $_visibility");
        _visibility = !_visibility;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () {
            changeVisibility();
          },
          icon: _visibility ? getMinusIcon() : Icon(Icons.add, color: ProodontoColors.ternary,),
          label: Text(widget.text, style: TextStyle(color: Colors.black87),),
        ),
        Visibility(visible: _visibility, child: widget.child)
      ],
    );
  }
}
