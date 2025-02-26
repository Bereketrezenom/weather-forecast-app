import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  final String city;
  WeatherScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather in $city')),
      body: FutureBuilder(
        future: Provider.of<WeatherProvider>(context, listen: false).fetchWeather(city),
        builder: (context, snapshot) {
          return Consumer<WeatherProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.errorMessage != null) {
                return Center(child: Text(provider.errorMessage!));
              }
              if (provider.weather == null) {
                return Center(child: Text('No data available'));
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.weather!.city,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${provider.weather!.temperature.toStringAsFixed(1)}°C',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(provider.weather!.description),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}