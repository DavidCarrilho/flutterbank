import 'package:flutter/material.dart';

import '../models/models.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionItem(this._transaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transaction.value.toString()),
        subtitle: Text(_transaction.accountNumber.toString()),
      ),
    );
  }
}
