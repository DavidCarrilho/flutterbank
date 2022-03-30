import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Autenticação'),
      content: TextField(
        keyboardType: TextInputType.number,
        obscureText: true,
        maxLength: 4,
        style: TextStyle(fontSize: 40.0, letterSpacing: 34.0),
        textAlign: TextAlign.center,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
      actions: <Widget>[
        FlatButton(onPressed: () {}, child: Text('Cancelar')),
        FlatButton(onPressed: () {}, child: Text('Confirmar')),
      ],
    );
  }
}
