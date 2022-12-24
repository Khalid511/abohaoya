import 'package:flutter/material.dart';
import 'package:abohaoya/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findRootAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {

  //System theme
  ThemeMode themeMode = ThemeMode.system;
  void changeThemeMode(ThemeMode themeMode) {
    setState(() {
      this.themeMode = themeMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A simple weather app',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        //brightness: Brightness.light,
        //primaryColor: Colors.lightBlue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: Home(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'A simple weather app',
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//         brightness: Brightness.light,
//         //primaryColor: Colors.lightBlue,
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       themeMode: ThemeMode.dark,
//       home: Home(),
//     );
//   }
// }

