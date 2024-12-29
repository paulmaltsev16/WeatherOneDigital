import 'package:weather_one_digital/data/weather/weather_repository.dart';
import 'package:weather_one_digital/data/weather/weather_repository_impl.dart';

class RemoveWeatherByCountyUseCase {
  RemoveWeatherByCountyUseCase({WeatherRepository? repository})
      : repository = repository ?? WeatherRepositoryImpl();

  final WeatherRepository repository;

  Future<void> call(String countryName) async {
    return await repository.removeWeatherByCounty(countryName);
  }
}
