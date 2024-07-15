import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherDetailScreen extends StatelessWidget {
  final Weather weather;

  WeatherDetailScreen({@required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.cityName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Temperature: ${weather.temperature} °C'),
            Text('Humidity: ${weather.humidity} %'),
            Text('Description: ${weather.description}'),
          ],
        ),
      ),
    );
  }
}
