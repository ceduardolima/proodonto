import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proodonto/ui/login/login.dart';

void main() => runApp(const Proodonto());

class Proodonto extends StatelessWidget {
  const Proodonto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
