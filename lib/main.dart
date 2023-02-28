import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/injection.dart';
import 'package:weather_app/pages/home_page.dart';

void main() async {
  const env = 'development';
  await dotenv.load(fileName: '.env.$env');
  configureDependencies();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => getIt<WeatherBloc>(),
        child: const HomePage(),
      ),
    ),
  );
}
