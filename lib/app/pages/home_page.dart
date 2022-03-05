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
          Editor(
            controller: _controladorCampoNumeroConta,
            dica: '0000',
            icon: Icons.monetization_on,
            label: 'Número da conta',
          ),
          Editor(
            controller: _controladorCampoValor,
            label: 'Valor',
            dica: '00,00',
            icon: Icons.monetization_on,
          ),
          RaisedButton(
            onPressed: () => _criaTransferencia(),
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }

  void _criaTransferencia() {
    final int numeroConta = int?.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double?.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(
        numeroConta,
        valor,
      );
      developer.log('$transferenciaCriada');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final dica;
  final IconData icon;

  const Editor({
    this.controller,
    this.label,
    this.dica,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: label,
          hintText: dica,
          icon: Icon(icon),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
