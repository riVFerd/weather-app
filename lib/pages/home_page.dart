import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/components/input_field.dart';
import 'package:weather_app/components/weather_forecast_box.dart';
import 'package:weather_app/models/weather_forecast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF262626),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InputField(
                    inputController: inputController,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context).add(
                    FetchWeather(inputController.text),
                  );
                },
                child: const Text('Search'),
              ),
              Expanded(
                flex: 8,
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return const Text('Please enter a city name');
                    } else if (state is WeatherLoaded) {
                      return MainContent(
                        cityName: state.weather.city,
                        countryName: state.weather.country,
                        weatherForecast: state.weather.forecast,
                      );
                    }
                    return const Text('Error');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final String cityName;
  final String countryName;
  final List<WeatherForecast> weatherForecast;

  const MainContent({
    Key? key,
    required this.cityName,
    required this.countryName,
    required this.weatherForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '$cityName ($countryName)',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: ListView.builder(
            itemCount: weatherForecast.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: WeatherForecastBox(
                  weatherForecast: weatherForecast[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
