import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart';

import '../../app/models/models.dart';
import '../web_client.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
    developer.log('decoded json $decodedJson');
    return transactions;
  }

  Future<Transaction> save({Transaction transaction, String password}) async {
    final String transactionJson = jsonEncode(transaction.toJson());
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
    _throwHttpError(response.statusCode);
    return Transaction.fromJson(jsonDecode(response.body));
  }

  void _throwHttpError(int statusCode) {
    if (statusCode == 400) {
      throw Exception(_statusCodeResponses[statusCode]);
    }
    if (statusCode == 401) {
      throw Exception(_statusCodeResponses[statusCode]);
    }
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'Ocorreu algum erro no envio da trânsferencia.',
    401: 'Ocorreu algum erro de autenticação.',
  };
}
