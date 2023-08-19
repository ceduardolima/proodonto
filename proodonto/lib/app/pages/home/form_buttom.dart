import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  FormButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.imagePath,
  });

  final String text;
  final IconData? icon;
  final String? imagePath;
  final Function onPressed;
  static const double _buttonSize = 50;
  static const double _buttonRadius = 50;
  static const double _iconSize = 30;
  final BoxShadow _boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
    offset: const Offset(0, 3),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(1)),
            color: Colors.white,
            boxShadow: [_boxShadow]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => {onPressed()},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: _buttonSize,
                    height: _buttonSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_buttonRadius),
                      color: Colors.blue,
                    ),
                    child: (icon != null)
                        ? Icon(icon, size: _iconSize, color: Colors.white)
                        : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              imagePath!,
                            ),
                          ),
                  ),
                  Container(height: 20),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
