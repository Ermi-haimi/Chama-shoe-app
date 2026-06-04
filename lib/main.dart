import 'package:chama_chama/cart_provider.dart';
import 'package:chama_chama/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chama_chama/l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  ThemeMode _themeMode = ThemeMode.light;

  void changeLanguage(String code) {
    setState(() {
      _locale = Locale(code);
    });
  }

  void changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      locale: _locale,
      themeMode: _themeMode,

      theme: ThemeData(
        brightness: Brightness.light,

        scaffoldBackgroundColor: Colors.white,

        colorScheme: ColorScheme.light(
          primary: Colors.deepOrange,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor: Colors.black,

        colorScheme: ColorScheme.dark(
          primary: Colors.orange,
        ),
      ),

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en'),
        Locale('am'),
      ],

      home: SafeArea(
        child: HomeShoeList(),
      ),
    );
  }
}
