import 'http_method.dart';

abstract class HttpRequest {
  String get fullUrl;

  HttpMethod get httpMethod;

  Map<String, String> get headers;

  Map<String, dynamic> get params;
}
