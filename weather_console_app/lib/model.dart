class Weather {
  final String lastUpdated;
  final String cityName;
  final double tempC;
  final double feelsLikeC;
  final String condition;

  Weather({
    required this.lastUpdated,
    required this.cityName,
    required this.condition,
    required this.feelsLikeC,
    required this.tempC,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final currentData = json['current'];
    return Weather(
      lastUpdated: currentData['last_updated'],
      cityName: json['location']['name'],
      condition: currentData['condition']['text'],
      feelsLikeC: currentData['feelslike_c'].toDouble(),
      tempC: currentData['temp_c'].toDouble(),
    );
  }
}
