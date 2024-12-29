import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/core/network/network_manager.dart';
import 'package:weather_one_digital/data/weather/request/get_weather_request.dart';
import 'package:weather_one_digital/data/weather/weather_repository.dart';
import 'package:async/async.dart';

const _weatherLocalStorage = "weather_local_storage";

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Result> searchWeatherByCountryName(String countryName) async {
    final request = GetWeatherRequest(countryName: countryName);
    final result = await NetworkManager().makeRequest(request);

    if (result.isValue) {
      final model = WeatherModel.fromJson(result.asValue?.value);
      await _saveWeatherToLocalStorage(model);
      return Result.value(model);
    } else {
      return result;
    }
  }

  Future<void> _saveWeatherToLocalStorage(WeatherModel weather) async {
    // Recommended to use SQL or Hive for storing large amounts of data.
    // For simplicity, use SharedPreferences.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final listOfStrings = prefs.getStringList(_weatherLocalStorage);
    listOfStrings?.add(jsonEncode(weather.toJson()));
    await prefs.setStringList(_weatherLocalStorage, listOfStrings ?? []);
  }

  @override
  Future<List<WeatherModel>> getWeather() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final listOfStrings = prefs.getStringList(_weatherLocalStorage);
    final List<WeatherModel> weatherList = [];
    for (var item in listOfStrings ?? []) {
      final json = jsonDecode(item);
      final model = WeatherModel.fromJson(json);
      weatherList.add(model);
    }

    return weatherList;
  }

  @override
  Future<void> removeWeatherByCounty(String countryName) async {}
}
