import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/interceptors.dart';

const String baseUrl = 'http://192.168.1.109:8080/transactions';

final Client client =
    HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
