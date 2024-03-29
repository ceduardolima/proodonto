import 'package:flutter/material.dart';

import 'colors.dart';

class MainInputTheme {
  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(
      color: color,
      fontSize: size
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: color,
        width: 1.0
      )
    );
  }

  InputDecorationTheme inputTheme() => InputDecorationTheme(
    contentPadding: const EdgeInsets.all(20),
    constraints: const BoxConstraints(minWidth: 150),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: _buildBorder(Colors.grey[600]!),
    focusedErrorBorder: _buildBorder(Colors.red),
    errorBorder: _buildBorder(Colors.red),
    focusedBorder: _buildBorder(ProodontoColors.ternary),
    disabledBorder: _buildBorder(Colors.grey[600]!),
    suffixStyle: _buildTextStyle(Colors.black87),
    counterStyle: _buildTextStyle(Colors.black87, size: 12.0),
    floatingLabelStyle: _buildTextStyle(Colors.black87),
    errorStyle: _buildTextStyle(Colors.red, size: 12),
    helperStyle: _buildTextStyle(Colors.black87, size: 12),
    hintStyle: _buildTextStyle(Colors.grey),
    labelStyle: _buildTextStyle(Colors.black87),
    prefixStyle: _buildTextStyle(Colors.black87),
  );
  
  ElevatedButtonThemeData elevatedButtonTheme() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ProodontoColors.ternary,
        onPrimary: Colors.white,
      ));
}