import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weather.getcolor(),
          weather.getcolor()[300]!,
          weather.getcolor()[50]!,
          // weather.getcolor()[],
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              weather.countryName,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "Updated at ${extractTime(weather.lastUpdate)}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    weather.icon,
                  ),
                  Text(
                    weather.avgtemp.toString(),
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("MaxTemp: ${weather.maxtemp}"),
                      Text("MinTemp: ${weather.mintemp}"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              weather.weatherCondation,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }

  String extractTime(String dateTimeString) {
    List<String> parts = dateTimeString.split(' ');
    String timeString = parts[1];
    List<String> timeParts = timeString.split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    String time =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    return time;
  }
}
