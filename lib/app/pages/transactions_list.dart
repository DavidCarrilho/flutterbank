import 'package:flutter/material.dart';

import '../../http/webclients/transactions_webclient.dart';
import '../components/centered_message.dart';
import '../components/components.dart';
import '../models/models.dart';

class TransactionsList extends StatelessWidget {
  final TransactionWebClient _webClient = TransactionWebClient();

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
        title: Text('Transações'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Transaction>>(
        future: Future.delayed(Duration(seconds: 2))
            .then((value) => _webClient.findAll()),
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
              if (snapshot.hasData) {
                final List<Transaction> transactions = snapshot.data;
                if (transactions.isNotEmpty) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
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
                }
              }
              return CenteredMessage(
                message: 'Nenhuma transação encontrada',
                icon: Icons.warning,
              );
              break;
          }
          return CenteredMessage(message: 'Erro desconhecido');
        },
      ),
    );
  }
}
