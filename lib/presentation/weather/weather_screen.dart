import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_one_digital/presentation/weather/weather_view_model.dart';
import 'package:weather_one_digital/presentation/weather/widgets/weather_list.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  static String route = "/weather";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncWeather = ref.watch(weatherViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: switch (asyncWeather) {
          AsyncData(:final value) => WeatherList(weather: value.value),
          AsyncError(:final error) => Text('Error: $error'),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}
