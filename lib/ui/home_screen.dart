import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter City Name'),
            ),
            SizedBox(height: 20),
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
              child: Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
