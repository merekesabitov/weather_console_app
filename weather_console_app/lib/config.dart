class Config {
  Config._internal();

  static final Config _instance = Config._internal();

  factory Config() => _instance;

  String apiKey = '0aa08a9cb9ba4ac5a2365629242802';

  String baseUrl = 'http://api.weatherapi.com/v1';
  String currentUrl = 'current.json';
  String forecastUrl = 'forecast.json';

  
}
