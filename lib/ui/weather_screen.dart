import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/local_provider.dart';
import '../providers/weather_provider.dart';
 // Add this import

class WeatherScreen extends StatelessWidget {
  final String city;
  WeatherScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localeProvider.locale.languageCode == 'en'
              ? 'Weather in $city'
              : 'በ$city ውስጥ የአየር ሁኔታ', // Amharic translation
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<WeatherProvider>(context, listen: false).fetchWeather(city),
        builder: (context, snapshot) {
          return Consumer<WeatherProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.errorMessage != null) {
                return Center(
                  child: Text(
                    localeProvider.locale.languageCode == 'en'
                        ? provider.errorMessage!
                        : 'የአየር ሁኔታ መረጃ ማግኘት አልተቻለም', // Amharic translation
                  ),
                );
              }
              if (provider.weather == null) {
                return Center(
                  child: Text(
                    localeProvider.locale.languageCode == 'en'
                        ? 'No data available'
                        : 'ዳታ የለም', // Amharic translation
                  ),
                );
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