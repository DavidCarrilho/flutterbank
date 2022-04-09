import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart';

import '../../app/models/models.dart';
import '../web_client.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions =
        decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
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

    if (response.statusCode == 400) {
      throw Exception('Ocorreu algum erro no envio da trânsferencia.');
    }
    if (response.statusCode == 401) {
      throw Exception('Ocorreu algum erro de autenticação.');
    }
    return Transaction.fromJson(jsonDecode(response.body));
  }
}
