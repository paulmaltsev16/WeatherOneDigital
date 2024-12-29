import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/domain/weather/get_weather_by_country_use_case.dart';

part "weather_view_model.g.dart";

@riverpod
class WeatherViewModel extends _$WeatherViewModel {
  final _getWeatherByCountry = GetWeatherByCountryUseCase();

  @override
  FutureOr<AsyncValue> build() async {
    final result = await _getWeatherByCountry("Israel");

    if (result.isValue) {
      final model = result.asValue?.value;
      return AsyncData<List<WeatherModel>>([model]);
    } else {
      return AsyncError(
          result.asError?.error ?? "Can't proceed with this request",
          StackTrace.current);
    }
  }
}
