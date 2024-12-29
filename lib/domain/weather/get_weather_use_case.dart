import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/data/weather/weather_repository.dart';
import 'package:weather_one_digital/data/weather/weather_repository_impl.dart';

class GetWeatherUseCase {
  GetWeatherUseCase({WeatherRepository? repository})
      : repository = repository ?? WeatherRepositoryImpl();

  final WeatherRepository repository;

  Future<List<WeatherModel>> call() async {
    return await repository.getWeather();
  }
}
