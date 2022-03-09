import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

const _appTitle = "Nova transferência";
const _label = "Valor";
const _valueFieldHint = "0.00";
const _numberCountFieldLabel = "Número da conta";
const _numberCountFieldHint = "0000";
const _confirmationButtonText = "Confirmar";

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _countNumberController = TextEditingController();
  final TextEditingController _valueFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            CustomField(
              controller: _countNumberController,
              hint: _numberCountFieldHint,
              icon: Icons.account_balance_wallet,
              label: _numberCountFieldLabel,
            ),
            CustomField(
              controller: _valueFieldController,
              label: _label,
              hint: _valueFieldHint,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _createTransaction(context),
              child: Text(_confirmationButtonText),
            )
          ],
        ),
      ),
    );
  }

  void _createContac(BuildContext context) {
    final int accountNumber = int?.tryParse(_countNumberController.text);
    final double value = double?.tryParse(_valueFieldController.text);
    if (accountNumber != null && value != null) {
      final createdTransaction = Transaction(
        accountNumber: accountNumber,
        value: value,
      );
      Navigator.pop(context, createdTransaction);
    }
  }

  void _createTransaction(BuildContext context) {
    final int accountNumber = int?.tryParse(_countNumberController.text);
    final double value = double?.tryParse(_valueFieldController.text);
    if (accountNumber != null && value != null) {
      final createdTransaction = Transaction(
        accountNumber: accountNumber,
        value: value,
      );
      Navigator.pop(context, createdTransaction);
    }
  }
}
