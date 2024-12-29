import 'package:flutter/material.dart';

class WeatherInformationItem extends StatelessWidget {
  const WeatherInformationItem(this.value, {super.key});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
