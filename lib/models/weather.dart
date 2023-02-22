import 'package:weather_app/models/weather_forecast.dart';

class Weather {
  final String city;
  final String country;
  final String currentCondition;
  final String currentIconUrl;
  final double currentTempC;
  final List<WeatherForecast> forecast;

  Weather({
    required this.city,
    required this.country,
    required this.currentCondition,
    required this.currentIconUrl,
    required this.currentTempC,
    required this.forecast,
  });

  @override
  String toString() {
    return 'Weather{city: $city, country: $country, currentCondition: $currentCondition, currentIconUrl: $currentIconUrl, currentTempC: $currentTempC, forecast: $forecast}';
  }
}
