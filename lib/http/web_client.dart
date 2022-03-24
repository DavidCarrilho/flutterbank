import 'dart:convert';

import 'package:flutterbank/app/models/models.dart';
import 'package:flutterbank/app/pages/pages.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'dart:developer' as developer;

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

Future<List<Transaction>> findAll() async {
  final Client client =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client
      .get('http://192.168.1.109:8080/transactions')
      .timeout(Duration(seconds: 5));
  final List<dynamic> decodeedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodeedJson) {
    final Map<String, dynamic> contatcJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      value: transactionJson['value'],
      contact: Contact(
        id: 0,
        name: transactionJson['name'],
        accountNumber: transactionJson['accountNumber'],
      ),
    );
  }
  return transactions;
}

// void save(Transaction transaction) {
//   post(url);
// }
