import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../screens/weather_detail_screen.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  WeatherCard({@required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(weather.cityName),
        subtitle: Text('${weather.temperature} °C'),
        trailing: Text(weather.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WeatherDetailScreen(weather: weather),
            ),
          );
        },
      ),
    );
  }
}
