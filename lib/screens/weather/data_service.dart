import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unicode_task/screens/weather/models.dart';


class DataService{
  Future<WeatherResponse> getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParameters = {
      'q':city , 
      'appid': '18be24a3f71f3f5983ff5eb8ae7f040e', 
      'units': 'metric'
    };


    final uri = Uri.http(
      'api.openweathermap.org','/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);
    final json =jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}