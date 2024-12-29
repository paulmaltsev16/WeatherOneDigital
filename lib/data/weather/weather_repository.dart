import 'package:async/async.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Result> searchWeatherByCountryName(String countryName);

  Future<List<WeatherModel>> getWeather();
}
