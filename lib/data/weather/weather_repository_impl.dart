import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/core/network/network_manager.dart';
import 'package:weather_one_digital/data/weather/request/get_weather_request.dart';
import 'package:weather_one_digital/data/weather/weather_repository.dart';
import 'package:async/async.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Result> searchWeatherByCountryName(String countryName) async {
    final request = GetWeatherRequest(countryName: countryName);
    final result = await NetworkManager().makeRequest(request);

    if (result.isValue) {
      final model = WeatherModel.fromJson(result.asValue?.value);
      return Result.value(model);
    } else {
      return result;
    }
  }

  @override
  Future<List<WeatherModel>> getWeather() async {
    return [];
  }
}
