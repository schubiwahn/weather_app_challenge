import 'package:flutter/material.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: FilledButton(
          child: const Text('fetch weather'),
          onPressed: () {
            WeatherRepository().getWeather('Stuttgart');
          },
        ),
      ),
    );
  }
}
