class Weather {
  final int minTemp;
  final int maxTemp;

  final int temp;

  Weather({
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final minTemp = json['min_temp'];
    final maxTemp = json['max_temp'];

    final temp = json['temp'];

    return Weather(
      minTemp: minTemp,
      maxTemp: maxTemp,
      temp: temp,
    );
  }
}
