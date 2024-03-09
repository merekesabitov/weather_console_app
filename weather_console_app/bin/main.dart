import 'dart:io';
import 'package:weather_console_app/api_service.dart';

void main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Syntax error:  dart bin/main.dart <city>');
    return;
  }

  final cityName = arguments.first;
  //print(cityName);

  final weatherApiService = ApiService();

//Getting current weather
  try {
    final currentWeather = await weatherApiService.getCurrentWeather(cityName);
    print('Current weather for $cityName');
    print(currentWeather);
    print('-----------------------------\n');
  } on WeatherApiException catch (error) {
    print('Error ${error.message}');
  } on SocketException catch (_) {
    print('Сould not fetch current weather. Check your internet');
  } on Exception catch (e) {
    print('$e');
  }

  //Getting weekly forecast
  try {
    final weeklyForecast = await weatherApiService.getWeeklyForecast(cityName);
    print('Weekly forecast for $cityName');
    // ignore: avoid_function_literals_in_foreach_calls
    weeklyForecast.forEach((forecast) {
      print(forecast);
      print('-----------------------------');
    });
  } on WeatherApiException catch (error) {
    print('Error ${error.message}');
  } on SocketException catch (_) {
    print('Сould not fetch weekly forecast. Check your internet');
  } on Exception catch (e) {
    print('$e');
  }
}
