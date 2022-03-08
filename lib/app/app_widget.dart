import 'package:flutter/material.dart';
import 'package:flutterbank/app/pages/pages.dart';

import 'design_system/colors/colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutterbank',
      theme: ThemeData(
        primaryColor: kColorPurple,
        accentColor: kColorAccentPurple,
        buttonTheme: ButtonThemeData(
          buttonColor: kColorAccentPurple,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: HomePage(),
    );
  }
}
