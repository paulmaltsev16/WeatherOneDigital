import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final listOfStrings = prefs.getStringList(_weatherLocalStorage) ?? [];
      listOfStrings.add(jsonEncode(weather.toJson()));

      bool isSaved =
          await prefs.setStringList(_weatherLocalStorage, listOfStrings);

      if (isSaved) {
        debugPrint("${weather.name} saved locally.");
      } else {
        debugPrint("Failed to save ${weather.name} locally.");
      }
    } catch (e) {
      debugPrint("Error saving weather data: $e");
    }
  }

  @override
  Future<List<WeatherModel>> getWeather() async {
    return await _getWeatherFromLocalStorage();
  }

  @override
  Future<void> removeWeatherByCountry(String countryName) async {
    try {
      final weatherList = await _getWeatherFromLocalStorage();

      final updatedWeatherList =
          weatherList.where((weather) => weather.name != countryName).toList();

      SharedPreferences prefs = await SharedPreferences.getInstance();

      final updatedListOfStrings = updatedWeatherList
          .map((weather) => jsonEncode(weather.toJson()))
          .toList();

      await prefs.setStringList(_weatherLocalStorage, updatedListOfStrings);
      debugPrint("$countryName removed locally.");
    } catch (e) {
      debugPrint("Error removing weather data for $countryName: $e");
    }
  }

  Future<List<WeatherModel>> _getWeatherFromLocalStorage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final listOfStrings = prefs.getStringList(_weatherLocalStorage);
      final List<WeatherModel> weatherList = listOfStrings?.map((item) {
            final json = jsonDecode(item);
            return WeatherModel.fromJson(json);
          }).toList() ??
          [];

      return weatherList;
    } catch (e) {
      debugPrint("Error retrieving weather data: $e");
      return [];
    }
  }
}
