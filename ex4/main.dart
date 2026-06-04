import 'package:flutter/material.dart';

// ── Weather Enum ──────────────────────────────────────────────────────────────
enum WeatherType {
  sunny(imagePath: 'assets/ex4/sunny.png'),
  cloudy(imagePath: 'assets/ex4/cloudy.png'),
  sunnyCloudy(imagePath: 'assets/ex4/sunnyCloudy.png'),
  veryCloudy(imagePath: 'assets/ex4/veryCloudy.png');

  final String imagePath;
  const WeatherType({required this.imagePath});
}

// ── WeatherCard Widget ────────────────────────────────────────────────────────
class WeatherCard extends StatelessWidget {
  final String city;
  final int currentTemp;
  final int minTemp;
  final int maxTemp;
  final WeatherType weatherType;

  const WeatherCard({
    super.key,
    required this.city,
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherType,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      elevation: 8,
      shadowColor: Colors.black45,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF9B59B6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: city name + temperatures
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$currentTemp°C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Min: $minTemp°C   Max: $maxTemp°C',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
            // Right side: weather image in a circle
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white24,
              child: Image.asset(weatherType.imagePath, width: 50, height: 50),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Main App ──────────────────────────────────────────────────────────────────
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF0F4FF),
        appBar: AppBar(title: const Text('Ex 4 – Weather Forecast')),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: const [
            WeatherCard(
              city: 'Phnom Penh',
              currentTemp: 34,
              minTemp: 28,
              maxTemp: 37,
              weatherType: WeatherType.sunny,
            ),
            WeatherCard(
              city: 'Siem Reap',
              currentTemp: 30,
              minTemp: 25,
              maxTemp: 33,
              weatherType: WeatherType.sunnyCloudy,
            ),
            WeatherCard(
              city: 'Sihanoukville',
              currentTemp: 27,
              minTemp: 24,
              maxTemp: 30,
              weatherType: WeatherType.cloudy,
            ),
            WeatherCard(
              city: 'Battambang',
              currentTemp: 25,
              minTemp: 22,
              maxTemp: 29,
              weatherType: WeatherType.veryCloudy,
            ),
          ],
        ),
      ),
    );
  }
}
