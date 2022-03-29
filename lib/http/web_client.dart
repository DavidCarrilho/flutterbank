import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../app/models/models.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    developer.log('Request');
    developer.log('url: ${data.requestUrl}');
    developer.log('headers: ${data.headers}');
    developer.log('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    developer.log('Response');
    developer.log('status code: ${data.statusCode}');
    developer.log('headers ${data.headers}');
    developer.log('body: ${data.body}');
    return data;
  }
}

const String baseUrl = 'http://192.168.1.109:8080/transactions';

final Client client = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

Future<List<Transaction>> findAll() async {
  final Response response = await client.get(baseUrl).timeout(Duration(seconds: 5));
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

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber,
    },
  };
  final String transactionJson = jsonEncode(transactionMap);

  final Response response = await client.post(
    baseUrl,
    headers: {
      'Content-type': 'application/json',
      'password': '1000',
    },
    body: transactionJson,
  );

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
