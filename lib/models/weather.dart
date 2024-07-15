class Weather {
  final String cityName;
  final double temperature;
  final int humidity;
  final String description;

  Weather({this.cityName, this.temperature, this.humidity, this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
    );
  }
}
