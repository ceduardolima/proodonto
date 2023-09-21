import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';

import '../pages/login/login.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  void _authCheck() {
    _auth.authStateChanges().listen((event) {
      user = (event == null) ? null : event;
      isLoading = false;
      notifyListeners();
    });
  }

  register(String email, String pwd) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email já está cadastrado');
      } else {
        throw AuthException("Não foi possível realizar o cadastro");
      }
    }
  }

  login(String email, String pwd) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      _getUser();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      if (e.code == 'unknown') {
        throw AuthException('Email não encotrado');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tentar novamente.');
      } else if (e.code == 'invalid-email') {
        throw AuthException("Email inválido");
      } else {
        throw AuthException("Não foi possível realizar o login");
      }
    }
  }

  logout(BuildContext context, ProodontoDatabase database) async {
    await _auth.signOut();
    _getUser();
   Navigator.of(context)
       .pushAndRemoveUntil(
       MaterialPageRoute(builder: (context) => LoginPage(database: database)),(route) => false);
  }

  void _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}