import 'package:flutter/material.dart';
import 'package:weather_app/home/repositories/weather_repository.dart';
import 'weather.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({
    Key? key,
    required this.cities,
    required this.temp,
    required int minTemp,
    required int maxTemp,
  }) : super(key: key);

  final List<String> cities;
  final double temp;

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late TextEditingController _searchController;
  String _selectedCity = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String value) {
    setState(() {
      _selectedCity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Card'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 168, 165, 165),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search City',
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: _onSearchSubmitted,
              ),
            ),
            DropdownButton<String>(
              value:
                  _selectedCity.isNotEmpty ? _selectedCity : widget.cities[0],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCity = newValue!;
                });
              },
              items:
                  widget.cities.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            FutureBuilder<Weather>(
              future: WeatherRepository().getWeather(
                _selectedCity.isNotEmpty ? _selectedCity : widget.cities[0],
              ),
              builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        _selectedCity.isNotEmpty
                            ? _selectedCity
                            : widget.cities[0],
                        style: const TextStyle(
                          color: Color.fromARGB(255, 247, 244, 244),
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
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
