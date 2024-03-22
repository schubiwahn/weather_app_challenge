import 'package:flutter/material.dart';
import 'package:weather_app/home/models/weather.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: WeatherRepository().getWeather("Hamm"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Hamm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              Text(
                "${snapshot.data?.temp}°C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                ),
              ),
              Text(
                "${snapshot.data?.minTemp}°C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
