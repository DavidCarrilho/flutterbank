import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import 'pages.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> _transaction = [];

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget._transaction.length,
        itemBuilder: (context, index) {
          final transaction = widget._transaction[index];
          return TransactionItem(transaction);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactForm();
          })).then(
            (transactionReceived) => _updateTransactionList(transactionReceived),
          );
        },
      ),
    );
  }

  void _updateTransactionList(Transaction transactionReceived) {
    if (transactionReceived != null) {
      setState(() {
        widget._transaction.add(transactionReceived);
      });
    }
  }
}
