part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String cityName;
  final int? days;

  const FetchWeather(this.cityName, {this.days});

  @override
  List<Object> get props => [cityName];
}