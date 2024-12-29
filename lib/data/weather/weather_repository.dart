import 'package:async/async.dart';

abstract class WeatherRepository {
  Future<Result> getWeather();
}