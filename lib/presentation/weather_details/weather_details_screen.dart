import 'package:flutter/material.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';
import 'package:weather_one_digital/domain/weather/remove_weather_by_contry_use_case.dart';
import 'package:weather_one_digital/presentation/weather_details/widgets/weather_information_item.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({required this.weatherModel, super.key});

  final WeatherModel weatherModel;

  static String route = "/weather-details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weatherModel.name ?? "Weather Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherInformationItem(
              "Temperature: ${(weatherModel.main?.temp ?? 0).toStringAsFixed(1)}°C",
            ),
            WeatherInformationItem(
              "Feels Like: ${(weatherModel.main?.feelsLike ?? 0).toStringAsFixed(1)}°C",
            ),
            WeatherInformationItem(
              "Min Temp: ${(weatherModel.main?.tempMin ?? 0).toStringAsFixed(1)}°C",
            ),
            WeatherInformationItem(
              "Max Temp: ${(weatherModel.main?.tempMax ?? 0).toStringAsFixed(1)}°C",
            ),
            WeatherInformationItem(
              "Humidity: ${weatherModel.main?.humidity ?? 0}%",
            ),
            WeatherInformationItem(
              "Pressure: ${weatherModel.main?.pressure ?? 0} hPa",
            ),
            WeatherInformationItem(
              "Cloudiness: ${weatherModel.clouds?.all ?? 0}%",
            ),
            WeatherInformationItem(
              "Visibility: ${(weatherModel.visibility ?? 0) / 1000} km",
            ),
            WeatherInformationItem(
              "Timezone Offset: ${(weatherModel.timezone ?? 0) ~/ 3600} hours",
            ),
            WeatherInformationItem(
              "Data Calculated at: ${DateTime.fromMillisecondsSinceEpoch((weatherModel.dt ?? 0) * 1000)}",
            ),
            SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {
                RemoveWeatherByCountyUseCase().call(weatherModel.name ?? "");
                Navigator.of(context).pop();
              },
              child: Text("Remove current weather information"),
            )
          ],
        ),
      ),
    );
  }
}
