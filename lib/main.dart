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
        primarySwatch: Colors.lightBlue,
        //primaryColor: Colors.lightBlue,
      ),
      home: Home(),
    );
  }
}

