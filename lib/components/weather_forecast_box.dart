import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast.dart';

class WeatherForecastBox extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const WeatherForecastBox({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    final date =
        '${weatherForecast.date.day}-${weatherForecast.date.month}-${weatherForecast.date.year}';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherForecast.condition,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Image.network(
                'https:${weatherForecast.iconUrl}',
              ),
              Text(
                '${weatherForecast.tempC.toString()} °C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
