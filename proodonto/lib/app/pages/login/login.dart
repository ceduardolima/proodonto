import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/shared/default_size.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
          child: LoginTextForm(database: database),
    ));
  }
}

class LoginTextForm extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ProodontoDatabase database;

  LoginTextForm({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Proodonto",
          style: TextStyle(
            fontSize: 32.0,
          ),
          textAlign: TextAlign.center,
        ),
        LoginTextField(
          emailController,
          "Email",
          TextInputType.emailAddress,
          hint: "xxxx@upe.com.br",
          icon: const Icon(Icons.email_outlined),
        ),
        LoginTextField(
          passwordController,
          "Senha",
          TextInputType.text,
          isPassword: true,
          icon: const Icon(Icons.password),
        ),
        LoginButton(database: database)
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String label;
  final Icon? icon;
  final TextInputType inputType;
  bool? isPassword = false;
  final String validatorMessenger = "O campo é obrigatório";

  LoginTextField(this.controller, this.label, this.inputType,
      {this.hint, this.icon, this.isPassword, Key? key})
      : super(key: key);

  String? formValidator(String? value) {
    if (value == null || value.isEmpty) {
      return validatorMessenger;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.medium),
      child: TextFormField(
        obscureText: isPassword ?? false,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(prefixIcon: icon, labelText: label, hintText: hint),
        validator: (String? value) => validatorMessenger,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  void _changeToHomePage(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(database: database)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.medium),
      child: ElevatedButton(
          onPressed: () => _changeToHomePage(context),
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            minimumSize: const Size.fromHeight(50),
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
