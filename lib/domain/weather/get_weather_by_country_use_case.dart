import 'package:weather_one_digital/data/weather/weather_repository.dart';
import 'package:async/async.dart';
import 'package:weather_one_digital/data/weather/weather_repository_impl.dart';

class GetWeatherByCountryUseCase {
  GetWeatherByCountryUseCase({WeatherRepository? repository})
      : repository = repository ?? WeatherRepositoryImpl();

  final WeatherRepository repository;

  Future<Result> call(String countyName) async {
    return await repository.getWeather(countyName);
  }
}