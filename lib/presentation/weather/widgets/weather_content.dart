import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/presentation/weather/widgets/weather_list.dart';

class WeatherContent extends ConsumerWidget {
  const WeatherContent({required this.weather, super.key});

  final List<WeatherModel> weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return weather.isEmpty
        ? Center(
            child: Text("Please add country first"),
          )
        : Column(
            children: [
              Expanded(
                child: WeatherList(weather: weather),
              ),
            ],
          );
  }
}
