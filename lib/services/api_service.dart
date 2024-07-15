import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';

class ApiService {
  final String apiKey = 'YOUR_API_KEY';
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String city) async {
    final response = await http.get('$apiUrl?q=$city&appid=$apiKey&units=metric');
    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
