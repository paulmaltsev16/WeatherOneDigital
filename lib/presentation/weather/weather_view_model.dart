import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/domain/weather/get_weather_by_country_use_case.dart';
import 'package:weather_one_digital/domain/weather/get_weather_use_case.dart';

part "weather_view_model.g.dart";

@riverpod
class WeatherViewModel extends _$WeatherViewModel {
  final _getWeatherByCountry = GetWeatherByCountryUseCase();
  final _getWeather = GetWeatherUseCase();
  final List<WeatherModel> weatherByCountry = [];

  @override
  FutureOr<AsyncValue> build() async {
    final weather = await _getWeather();
    weatherByCountry.addAll(weather);
    return AsyncData(weatherByCountry);
  }

  Future<void> searchWeatherByUserInput(String input) async {
    state = AsyncLoading();

    final Result result = await _getWeatherByCountry(input);

    switch (result) {
      case ValueResult(value: final weather):
        _weatherResponseHandler(weather);
        break;

      case ErrorResult(error: final error):
        _onErrorOccurredHandler(error);
        break;

      default:
        state = AsyncError("Unexpected error", StackTrace.current);
        debugPrint('Unexpected case');
    }
  }

  void _weatherResponseHandler(WeatherModel weather) {
    weatherByCountry.add(weather);
    state = AsyncData(AsyncValue.data(weatherByCountry));
  }

  void _onErrorOccurredHandler(Object error) {
    state = AsyncError(error, StackTrace.current);
  }

  void removeWeatherFromList(String countryName) {
    weatherByCountry.removeWhere((element) => element.name == countryName);
    state = AsyncData(AsyncValue.data(weatherByCountry));
  }
}
