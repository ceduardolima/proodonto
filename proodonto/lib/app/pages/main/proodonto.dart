import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/pages/login/login.dart';
import 'package:proodonto/app/theme/main_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proodonto/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Proodonto(
      database: await $FloorProodontoDatabase
          .databaseBuilder("proodonto_database.db")
          .build()));
}

class Proodonto extends StatelessWidget {
  const Proodonto({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      locale: const Locale('pt', 'BR'),
      home: LoginPage(database: database),
      theme: ThemeData(inputDecorationTheme: MainInputTheme().theme()),
    );
  }
}
