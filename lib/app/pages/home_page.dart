import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:simplebank/app/models/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormularioTranferencia(),
    );
  }
}

class FormularioTranferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '0000',
                  icon: Icon(Icons.monetization_on)),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  labelText: 'Valor',
                  hintText: '0',
                  icon: Icon(Icons.monetization_on)),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            onPressed: () {
              developer
                  .log('Numero da conta ${_controladorCampoNumeroConta.text}');
              final int numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double valor =
                  double.tryParse(_controladorCampoNumeroConta.text);
              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(
                  numeroConta,
                  valor,
                );
                developer.log('$transferenciaCriada');
              }
            },
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }
}
