import 'package:flutter/material.dart';

import 'design_system/colors/colors.dart';
import 'pages/pages.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterbank',
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
