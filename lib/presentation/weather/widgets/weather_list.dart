import 'package:flutter/material.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/presentation/weather/widgets/weather_item.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({required this.weather, super.key});

  final List<WeatherModel> weather;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: weather.length,
      itemBuilder: (context, index) {
        final weatherModel = weather[index];
        return WeatherItem(weatherModel: weatherModel);
      },
    );
  }
}
