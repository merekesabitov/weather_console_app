

import 'package:weather_console_app/api_service.dart';

void main(List<String> arguments) async {
  if(arguments.length != 1) {
    print('Syntax error:  dart bin/main.dart <city>');
    return;
  }

  final cityName = arguments.first;
  //print(cityName);

  final weatherApiService = ApiService();
  final currentWeather = await weatherApiService.getCurrentWeather(cityName);
  print(currentWeather.cityName);
  print(currentWeather.tempC);

}
