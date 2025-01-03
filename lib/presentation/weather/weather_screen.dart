import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_one_digital/presentation/weather/weather_view_model.dart';
import 'package:weather_one_digital/presentation/weather/widgets/weather_content.dart';
import 'package:weather_one_digital/presentation/weather/widgets/weather_input_field.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  static String route = "/weather";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncWeather = ref.watch(weatherViewModelProvider);

    ref.read(weatherViewModelProvider.notifier).build();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              WeatherInputField(
                onSearch: ref
                    .read(weatherViewModelProvider.notifier)
                    .searchWeatherByUserInput,
              ),
              Expanded(
                child: switch (asyncWeather) {
                  AsyncData(:final value) =>
                    WeatherContent(weather: value.value),
                  AsyncError(:final error) => Text('Error: $error'),
                  _ => const Center(child: CircularProgressIndicator()),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
