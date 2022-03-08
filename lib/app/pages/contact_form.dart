import 'package:flutter/material.dart';
import 'package:flutterbank/app/components/components.dart';

import 'package:flutterbank/app/models/models.dart';

const _appTitle = "Nova contato";
const _fullNameFieldLabel = "Nome completo";
const _fullNameFieldHint = "Nome completo";
const _numberAccountFieldLabel = "Número da conta";
const _numberAccountFieldHint = "1234";
const _confirmationButtonText = "Confirmar";

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
              controller: _nameController,
              label: _fullNameFieldLabel,
              hint: _fullNameFieldHint,
              icon: Icons.monetization_on,
            ),
            CustomField(
              controller: _accountNumberController,
              label: _numberAccountFieldLabel,
              hint: _numberAccountFieldHint,
              icon: Icons.account_balance_wallet,
            ),
            RaisedButton(
              onPressed: () {
                final String name = _nameController.text;
                final int accountNumer = int.tryParse(_accountNumberController.text);
                final Contact newContact = Contact(
                  name: name,
                  accountNumber: accountNumer,
                );
                Navigator.pop(context, newContact);
              },
              child: Text(_confirmationButtonText),
            )
          ],
        ),
      ),
    );
  }
}
