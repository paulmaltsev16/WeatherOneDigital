import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'http_method.dart';
import 'http_request.dart';

class NetworkManager {
  Future<Result> makeRequest(HttpRequest request) async {
    final url = request.params.isNotEmpty
        ? Uri.parse(request.fullUrl).replace(queryParameters: request.params)
        : Uri.parse(request.fullUrl);

    final http.Response? response;
    switch (request.httpMethod) {
      case HttpMethod.get:
        response = await http.get(url, headers: request.headers);
    }

    if (response.statusCode != 200) {
      debugPrint("NetworkManager response code is not 200. ${response.body}");
      return Result.error("Something went wrong");
    }

    try {
      final json = jsonDecode(response.body);
      return Result.value(json);
    } catch (error) {
      debugPrint("NetworkManager can't decode json: $error");
      return Result.error("Something went wrong");
    }
  }
}
