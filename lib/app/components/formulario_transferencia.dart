import 'package:flutter/material.dart';
import 'package:simplebank/app/components/components.dart';
import 'dart:developer' as developer;

import 'package:simplebank/app/models/models.dart';

class FormularioTranferencia extends StatefulWidget {
  @override
  _FormularioTranferenciaState createState() => _FormularioTranferenciaState();
}

class _FormularioTranferenciaState extends State<FormularioTranferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controladorCampoNumeroConta,
              dica: '0000',
              icon: Icons.account_balance_wallet,
              label: 'Número da conta',
            ),
            Editor(
              controller: _controladorCampoValor,
              label: 'Valor',
              dica: '00,00',
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int?.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double?.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(numeroConta, valor);
      developer.log('Criando transferencia');
      developer.log('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}