import 'package:flutter/material.dart';
import 'package:weather_forecast_app/location.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';


class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = locator<WeatherService>();

  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final fetchedWeather = await _weatherService.fetchWeather(city);
    
    if (fetchedWeather != null) {
      _weather = fetchedWeather;
    } else {
      _errorMessage = 'Could not fetch weather data';
    }

    _isLoading = false;
    notifyListeners();
  }
}