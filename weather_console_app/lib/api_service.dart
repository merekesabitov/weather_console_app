import 'dart:convert';
import 'package:weather_console_app/model.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class ApiService {
  Future<Weather> getCurrentWeather(String cityName) async {
    //https://api.weatherapi.com/v1/current.json?key=0aa08a9cb9ba4ac5a2365629242802&q=London&aqi=no

    final url =
        '${Config().baseUrl}/${Config().currentUrl}?key=${Config().apiKey}&q=${cityName}';
    print(url);

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Request failed with status ${response.statusCode}');
    }

    final Map<String, dynamic> jsonResponse =
        Map.castFrom(jsonDecode(response.body));

    if (jsonResponse.isEmpty) {
      print('Weather data for $cityName not found');
    }

    return Weather.fromJson(jsonResponse);
  }
}
