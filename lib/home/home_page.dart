import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/gen/assets.gen.dart';
import 'package:weather_app/home/models/weathercard.dart';
import 'package:weather_app/home/models/westherinfo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Assets.image.bachground.image(fit: BoxFit.fill),
          ),
          const Center(child: WeatherInfo()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Assets.image.house.image(height: 400, width: 400),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const WeatherCard(
                      cities: [
                        'Hamm',
                        'Paderborn',
                        'Berlin',
                        'Hannover',
                        'Hamburg',
                        'Dortmund',
                      ],
                      temp: 0,
                      minTemp: 0,
                      maxTemp: 0,
                    ),
                  ),
                );
              },
              child: SizedBox(
                child: Assets.image.tabBar.image(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
