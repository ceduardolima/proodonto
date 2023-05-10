import 'package:flutter/material.dart';
import 'package:proodonto/ui/home/home.dart';

import '../../utils/default_size.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
          child: LoginTextForm(),
    ));
  }
}

class LoginTextForm extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginTextForm({Key? key}) : super(key: key);

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
        const LoginButton()
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
    return TextFormField(
      obscureText: isPassword ?? false,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(icon: icon, labelText: label, hintText: hint),
      validator: (String? value) => validatorMessenger,
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  void _changeToHomePage(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
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
