import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart';

import '../../app/models/models.dart';
import '../web_client.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions =
        decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
    developer.log('decoded json $decodedJson');
    return transactions;
  }

  Future<Transaction> save({Transaction transaction, String password}) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 3));

    final Response response = await client.post(
      baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': password,
      },
      body: transactionJson,
    );

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throw HttpExpection(_getMessage(response.statusCode));
    // throw HttpExpection(_getMessage(500));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey((statusCode))) {
      return _statusCodeResponses[statusCode];
    }
    return 'Erro desconhecido';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'Ocorreu algum erro no envio da trânsferencia.',
    401: 'Ocorreu algum erro de autenticação.',
    409: 'Transação já existe.',
  };
}

class HttpExpection implements Exception {
  final String message;

  HttpExpection(this.message);
}
