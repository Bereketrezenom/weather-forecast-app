import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherService {
  static const String _apiKey = '32411d98fd3c0b85ab9a4ee21205bf04';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather?> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$_baseUrl?q=$city&appid=$_apiKey'));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      return null; 
    }
  }
}