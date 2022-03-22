import 'package:flutter/material.dart';
import 'package:flutterbank/app/components/components.dart';
import 'package:flutterbank/app/models/models.dart';
import 'package:flutterbank/http/web_client.dart';

class TransactionsList extends StatelessWidget {
  // final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    // transactions.add(
    //   Transaction(
    //     accountNumber: 111,
    //     contact: Contact(
    //       name: 'David',
    //       accountNumber: 111,
    //       id: 1,
    //     ),
    //     value: 100,
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: Future.delayed(Duration(seconds: 2)).then((value) => findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return ProgressWidget();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Transaction> transactions = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Transaction transaction = transactions[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text(
                        transaction.value.toString(),
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        transaction.contact.accountNumber.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              );
              break;
          }
          return Text('Erro desconhecido');
        },
      ),
    );
  }
}
