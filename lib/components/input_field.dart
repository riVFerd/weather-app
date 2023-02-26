import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputController;

  const InputField({
    super.key,
    required this.inputController,
  });

  // fetch weather data from the API
  void _fetchWeather(String cityName, BuildContext context) {
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather(cityName));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextField(
          onSubmitted: (inputText) => _fetchWeather(inputText, context),
          controller: inputController,
          decoration: const InputDecoration(
            hintText: 'Search for a city',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        ElevatedButton(
          onPressed: () => _fetchWeather(inputController.text, context),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
          ),
          child: const Text('Search'),
        ),
      ],
    );
  }
}
