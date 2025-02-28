import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Add this import
import 'package:provider/provider.dart';
import 'location.dart';
import 'providers/local_provider.dart';
import 'providers/weather_provider.dart';

import 'ui/home_screen.dart';

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
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            locale: localeProvider.locale, // Set the app's locale
            supportedLocales: const [
              Locale('en', 'US'), // English
              Locale('am', 'ET'), // Amharic
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate, // Material localization
              GlobalWidgetsLocalizations.delegate, // Widgets localization
              GlobalCupertinoLocalizations.delegate, // Cupertino localization
            ],
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}