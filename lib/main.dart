import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  const env = 'development';
  await dotenv.load(fileName: '.env.$env');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => WeatherBloc(
          weatherRepository: WeatherRepository(),
        ),
        child: const HomePage(),
      ),
    ),
  );
}
