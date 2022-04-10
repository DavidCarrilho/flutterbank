import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final String message;

  const ProgressWidget({this.message = ''});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          const SizedBox(height: 12.0),
          Text(message),
        ],
      ),
    );
  }
}
