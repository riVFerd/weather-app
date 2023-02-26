import 'package:dio/dio.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_forecast.dart';

class WeatherRepository {
  final Dio _dio = Dio();

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
    } on DioError catch (e) {
      if (e.type == DioErrorType.unknown) {
        throw const FormatException(
          'No Internet Connection',
          'lib/assets/network_error.png',
        );
      } else if (e.type == DioErrorType.badResponse) {
        throw const FormatException(
          'City not found',
          'lib/assets/notfound.png',
        );
      }
      throw FormatException('Error : $e', 'lib/assets/error.png');
    }
  }
}
