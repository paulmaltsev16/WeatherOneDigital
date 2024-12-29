import 'package:flutter/material.dart';
import 'package:weather_one_digital/presentation/weather/weather_screen.dart';
import 'package:weather_one_digital/presentation/weather_details/weather_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather One Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: WeatherScreen.route,
      routes: {
        WeatherScreen.route: (context) => const WeatherScreen(),
        WeatherDetailsScreen.route: (context) => const WeatherDetailsScreen(),
      },
    );
  }
}
