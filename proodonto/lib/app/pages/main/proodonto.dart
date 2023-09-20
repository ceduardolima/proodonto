import 'package:flutter/material.dart';
import 'package:proodonto/app/database/database.dart';
import 'package:proodonto/app/services/auth_service.dart';
import 'package:proodonto/app/theme/colors.dart';
import 'package:proodonto/app/theme/main_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proodonto/app/widget/auth_check.dart';
import 'package:proodonto/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
    ],
    child: Proodonto(
      database: await $FloorProodontoDatabase
          .databaseBuilder("proodonto_database.db")
          .build(),
    ),
  ));
}

class Proodonto extends StatelessWidget {
  const Proodonto({Key? key, required this.database}) : super(key: key);
  final ProodontoDatabase database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: ProodontoColors.primary,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      locale: const Locale('pt', 'BR'),
      home: AuthCheck(database: database),
      theme: ThemeData(
        inputDecorationTheme: MainInputTheme().inputTheme(),
        elevatedButtonTheme: MainInputTheme().elevatedButtonTheme(),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: ProodontoColors.accent,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: ProodontoColors.primary,
          iconTheme: IconThemeData(color: ProodontoColors.ternary),
        ),
      ),
    );
  }
}
