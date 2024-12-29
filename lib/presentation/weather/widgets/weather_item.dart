import 'package:flutter/material.dart';
import 'package:weather_one_digital/core/models/weather_model.dart';

class WeatherItem extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherItem({
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Icon(
          //   ,
          //   size: 30.0,
          //   color: Colors.blue,
          // ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherModel.name ?? "-",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${weatherModel.main?.temp ?? "-"}°C',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
