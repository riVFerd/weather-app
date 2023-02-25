import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/components/input_field.dart';
import 'package:weather_app/components/weather_forecast_box.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_forecast.dart';

import '../components/error_text.dart';

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
        resizeToAvoidBottomInset: false,
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
              Expanded(
                flex: 8,
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return const ErrorText(
                          textContent: 'Please enter a city name');
                    } else if (state is WeatherLoaded) {
                      return MainContent(weather: state.weather);
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
  final Weather weather;

  const MainContent({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Text(
                '${weather.city} (${weather.country})\n Current Weather :',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Image.network('https:${weather.currentIconUrl}'),
              Text(
                '${weather.currentCondition}\n${weather.currentTempC}°C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8, left: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Weather Forecast :',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: weather.forecast.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: WeatherForecastBox(
                  weatherForecast: weather.forecast[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
