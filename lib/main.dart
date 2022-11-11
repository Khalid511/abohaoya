import 'package:flutter/material.dart';
import 'package:abohaoya/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A simple weather app',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('bn', ''), // bangla
      ],
      home: Home(),
    );
  }
}

