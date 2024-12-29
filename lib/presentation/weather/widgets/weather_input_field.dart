import 'package:flutter/material.dart';

class WeatherInputField extends StatefulWidget {
  const WeatherInputField({
    required this.onSearch,
    super.key,
  });

  final Function onSearch;

  @override
  _WeatherInputFieldState createState() => _WeatherInputFieldState();
}

class _WeatherInputFieldState extends State<WeatherInputField> {
  final _textController = TextEditingController();

  void _onSearch() {
    String inputText = _textController.text;
    widget.onSearch(inputText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            labelText: "Enter country name",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            ElevatedButton(
              onPressed: _onSearch,
              child: Text("Search"),
            ),
          ],
        ),
      ],
    );
  }
}
