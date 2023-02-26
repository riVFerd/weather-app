import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await weatherRepository.getWeather(event.cityName);
        emit(WeatherLoaded(weather));
      } on FormatException catch (e) {
        emit(WeatherError(message: e.message, imageUrl: e.source));
      }
    });
  }
}
