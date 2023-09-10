import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/home/home.dart';
import 'package:proodonto/app/services/auth_service.dart';
import 'package:proodonto/app/shared/default_size.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoging = true;
  late String buttonTitle;
  late String textButtonTitle;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (_isLoging) {
      buttonTitle = "Login";
      textButtonTitle = "Não tem conta? Click aqui Para se cadastrar!";
    } else {
      buttonTitle = "Cadastar";
      textButtonTitle = "Voltar ao login";
    }
  }

  void _changeToHomePage(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(database: widget.database)));
  }

  login(BuildContext context) async {
    setState(() => isLoading = true);
    try {
      await context.read<AuthService>().login(email.text, password.text);
    } on AuthException catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar(BuildContext context) async {
    setState(() => isLoading = true);
    try {
      await context.read<AuthService>().register(email.text, password.text);
    } on AuthException catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PaddingSize.big),
            child: Column(
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
                  email,
                  "Email",
                  TextInputType.emailAddress,
                  hint: "xxxx@upe.com.br",
                  icon: const Icon(Icons.email_outlined),
                ),
                LoginTextField(
                  password,
                  "Senha",
                  TextInputType.text,
                  isPassword: true,
                  icon: const Icon(Icons.password),
                ),
                LoginButton(
                  title: buttonTitle,
                  isLoading: isLoading,
                  onChanged: () {
                    if (_isLoging) {
                      login(context);
                    } else {
                      registrar(context);
                    }
                  },
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _isLoging = !_isLoging;
                        if (_isLoging) {
                          buttonTitle = "Login";
                          textButtonTitle =
                              "Não tem conta? Click aqui Para se cadastrar!";
                        } else {
                          buttonTitle = "Cadastar";
                          textButtonTitle = "Voltar ao login";
                        }
                      });
                    },
                    child: Text(textButtonTitle))
              ],
            )));
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
        decoration:
            InputDecoration(prefixIcon: icon, labelText: label, hintText: hint),
        validator: (String? value) => validatorMessenger,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.isLoading,
  }) : super(key: key);

  final Function onChanged;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSize.medium),
      child: ElevatedButton(
        onPressed: () {
          onChanged();
        },
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          minimumSize: const Size.fromHeight(50),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
      ),
    );
  }
}
