import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../db/dao/contact_dao.dart';
import '../components/components.dart';
import '../models/models.dart';

const _appTitle = "Nova contato";
const _fullNameFieldLabel = "Nome completo";
const _fullNameFieldHint = "Nome completo";
const _numberAccountFieldLabel = "Número da conta";
const _numberAccountFieldHint = "1234";
const _confirmationButtonText = "Cadastrar";

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final ContactDao _dao = ContactDao();
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
            const SizedBox(height: 12.0),
            Container(
              width: double.maxFinite,
              height: 50.0,
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              child: RaisedButton(
                onPressed: () {
                  final String name = _nameController.text;
                  final int accountNumer =
                      int.tryParse(_accountNumberController.text);
                  final Contact newContact = Contact(
                    id: 0,
                    name: name,
                    accountNumber: accountNumer,
                  );
                  _dao
                      .saveContact(contact: newContact)
                      .then((id) => Navigator.pop(context));
                },
                child: Text(
                  _confirmationButtonText,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
