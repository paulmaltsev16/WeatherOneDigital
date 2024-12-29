import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/presentation/weather/weather_view_model.dart';
import 'package:weather_one_digital/presentation/weather/widgets/weather_input_field.dart';
import 'package:weather_one_digital/presentation/weather/widgets/weather_list.dart';

class WeatherContent extends ConsumerWidget {
  const WeatherContent({required this.weather, super.key});

  final List<WeatherModel> weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: WeatherList(weather: weather),
        ),
      ],
    );
  }
}
