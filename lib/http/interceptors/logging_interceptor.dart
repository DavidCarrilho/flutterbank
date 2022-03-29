import 'dart:developer' as developer;

import 'package:http_interceptor/http_interceptor.dart';

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