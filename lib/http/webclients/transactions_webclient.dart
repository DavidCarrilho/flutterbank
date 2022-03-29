import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart';

import '../../app/models/models.dart';
import '../web_client.dart';

class TransactionWebClient {

  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    List<Transaction> transactions = _jsonToTransaction(response);
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = _toMap(transaction);
    final String transactionJson = jsonEncode(transactionMap);
    final Response response = await client.post(
      baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transactionJson,
    );
    return _toTransaction(response);
  }

  List<Transaction> _jsonToTransaction(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = [];
    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic> contatcJson = transactionJson['contact'];
      final Transaction transaction = Transaction(
        value: transactionJson['value'],
        contact: Contact(
          id: 0,
          name: contatcJson['name'],
          accountNumber: contatcJson['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }
    developer.log('decoded json $decodedJson');
    return transactions;
  }

  Transaction _toTransaction(Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    final Map<String, dynamic> contatcJson = json['contact'];
    return Transaction(
      value: json['value'],
      contact: Contact(
        id: 0,
        name: contatcJson['name'],
        accountNumber: contatcJson['accountNumber'],
      ),
    );
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.accountNumber,
      },
    };
    return transactionMap;
  }
}
