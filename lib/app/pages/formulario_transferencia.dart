import 'package:flutter/material.dart';
import 'package:flutterbank/app/components/components.dart';

import 'package:flutterbank/app/models/models.dart';

const _tituloApp = "Transferir";
const _rotulo = "Valor";
const _dicaCampoValor = "0.00";
const _rotuloCampoNumeroConta = "Número da conta";
const _dicaCampoNumeroConta = "0000";
const _textoBotaoConfirmar = "Confirmar";

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
        title: Text(_tituloApp),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controladorCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              icon: Icons.account_balance_wallet,
              label: _rotuloCampoNumeroConta,
            ),
            Editor(
              controller: _controladorCampoValor,
              label: _rotulo,
              dica: _dicaCampoValor,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
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
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
