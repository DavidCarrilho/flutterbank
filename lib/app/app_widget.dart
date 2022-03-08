import 'package:flutter/material.dart';
import 'package:flutterbank/app/pages/pages.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutterbank',
      theme: ThemeData(
        primaryColor: Colors.purple[900],
        accentColor: Colors.purple[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purpleAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: HomePage(),
    );
  }
}
