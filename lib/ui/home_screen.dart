import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  // App Logo (Optional, for consistency)
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/512/1146/1146869.png",
                    height: 100,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  // Title
                  Text(
                    "Weather App",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  // City Name Input Field
                  TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter City Name',
                      filled: true,
                      fillColor: Color(0xFFF5FCF9),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Get Weather Button
                  ElevatedButton(
                    onPressed: () {
                      final city = _controller.text.trim();
                      if (city.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => WeatherScreen(city: city)),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFF4A3298),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Get Weather"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
