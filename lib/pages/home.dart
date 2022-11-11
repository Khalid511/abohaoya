import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('আবহাওয়া দেখুন',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
    );
  }
}
