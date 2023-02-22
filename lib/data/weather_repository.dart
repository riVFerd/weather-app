import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_forecast.dart';

class WeatherRepository {
  final Dio _dio;

  WeatherRepository(this._dio);

  Future<Weather> getWeather(String city, {int days = 5}) async {
    try {
      final result = await _dio.get(
        'http://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': '053cf902dc6f433584e81851232102',
          'q': city,
          'days': days,
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      final location = result.data['location'];
      final current = result.data['current'];
      final forecast = result.data['forecast']['forecastday'];

      // create a list of weather forecast
      final List<WeatherForecast> forecastList = forecast
          .map<WeatherForecast>((forecast) => WeatherForecast(
                date: DateTime.parse(forecast['date']),
                tempC: forecast['day']['avgtemp_c'].toDouble(),
                condition: forecast['day']['condition']['text'],
                iconUrl: forecast['day']['condition']['icon'],
              ))
          .toList();

      // create a weather object
      final weather = Weather(
        city: location['name'],
        country: location['country'],
        currentCondition: current['condition']['text'],
        currentIconUrl: current['condition']['icon'],
        currentTempC: current['temp_c'],
        forecast: forecastList,
      );

      return weather;
    } catch (e) {
      throw Exception('Error getting weather $e');
    }
  }
}
