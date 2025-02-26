import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast_app/location.dart';
import 'package:weather_forecast_app/ui/home_screen.dart';
import 'providers/weather_provider.dart';


void main() {
  setupLocator(); // Initialize dependency injection
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: HomeScreen(),
      ),
    );
  }
}