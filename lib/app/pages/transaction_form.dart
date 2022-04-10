import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbank/app/components/components.dart';
import 'package:flutterbank/app/components/response_dialog.dart';

import '../../http/webclients/transactions_webclient.dart';
import '../models/models.dart';
import 'dart:developer' as developer;

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transação'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contact.name,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: 'Valor'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                width: double.maxFinite,
                height: 50.0,
                child: RaisedButton(
                  child: Text(
                    'Trânsferir',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {
                    final double value = double.tryParse(_valueController.text);
                    final transactionCreated = Transaction(
                      value: value,
                      contact: widget.contact,
                    );

                    showDialog(
                      context: context,
                      builder: (contextDialog) {
                        return TransactionAuthDialog(
                          onConfirm: (String password) {
                            developer.log(password);
                            _save(transactionCreated, password, context);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save(
    Transaction transactionCreated,
    String password,
    BuildContext context,
  ) async {
    // await Future.delayed(Duration(seconds: 1));
    Transaction transaction = await _send(
      transactionCreated,
      password,
      context,
    );

    _showSeccessfullMessage(transaction, context);
  }

  Future _showSeccessfullMessage(
      Transaction transaction, BuildContext context) async {
    if (transaction != null) {
      await showDialog(
        context: context,
        builder: (contextDialog) =>
            SuccessDialog('Ocorreu tudo certo com sua transferência ;)'),
      );
      Navigator.pop(context);
    }
  }

  Future<Transaction> _send(Transaction transactionCreated, String password,
      BuildContext context) async {
    final Transaction transaction = await _webClient
        .save(transaction: transactionCreated, password: password)
        .catchError(
      (e) {
        print(e);
        _showFailureMessage(context, message: e.message);
      },
      test: (e) => e is HttpException,
    ).catchError(
      (e) {
        print(e);
        _showFailureMessage(context, message: 'Erro de timeout');
      },
      test: (e) => e is TimeoutException,
    ).catchError(
      (e) {
        print(e);
        _showFailureMessage(context);
      },
    );
    return transaction;
  }

  void _showFailureMessage(BuildContext context,
      {String message = 'Erro desconhecido'}) {
    showDialog(
      context: context,
      builder: (contextDialog) => FailureDialog('Erro desconhecido'),
    );
  }
}
