import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/api_service.dart';
import '../models/weather.dart';
import 'search_screen.dart';
import 'weather_detail_screen.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Weather _weather;

  void _searchWeather(String city) async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    Weather weather = await apiService.fetchWeather(city);
    setState(() {
      _weather = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
              if (city != null) {
                _searchWeather(city);
              }
            },
          ),
        ],
      ),
      body: _weather == null
          ? Center(child: Text('Search for a city'))
          : WeatherCard(weather: _weather),
    );
  }
}
