import 'package:weather_one_digital/core/app/constants.dart';
import 'package:weather_one_digital/core/app/sensitive_data.dart';
import 'package:weather_one_digital/core/network/http_method.dart';
import 'package:weather_one_digital/core/network/http_request.dart';

class GetWeatherRequest implements HttpRequest {
  GetWeatherRequest({required this.countryName});

  final String countryName;

  @override
  String get fullUrl => "${Constants.weatherBaseUrl}data/2.5/weather";

  @override
  Map<String, String> get headers => {};

  @override
  HttpMethod get httpMethod => HttpMethod.get;

  @override
  Map<String, dynamic> get params => {
        'q': countryName,
        "appid": SensitiveData.weatherApiKey,
      };
}
