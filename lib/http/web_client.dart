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

void findAll() async {
  final Client client =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get('http://192.168.1.109:8080/transactions');
}
