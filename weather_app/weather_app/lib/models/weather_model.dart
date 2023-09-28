import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final String countryName;
  final String lastUpdate;
  final double avgtemp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondation;
  final String icon;
  WeatherModel(
      {required this.cityName,
      required this.countryName,
      required this.avgtemp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherCondation,
      required this.icon,
      required this.lastUpdate});

  factory WeatherModel.fromjson(jsonData) {
    return WeatherModel(
      cityName: jsonData["location"]["name"],
      countryName: jsonData["location"]["country"],
      avgtemp: jsonData["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxtemp: jsonData["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: jsonData["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherCondation: jsonData["forecast"]["forecastday"][0]["day"]
          ["condition"]["text"],
      icon:
          'https:${jsonData["forecast"]["forecastday"][0]["day"]["condition"]["icon"]}',
      lastUpdate: jsonData["location"]["localtime"],
    );
  }

  MaterialColor getcolor() {
    if (avgtemp <= 5) {
      return Colors.blue;
    } else if (5 < avgtemp && avgtemp <= 15) {
      return Colors.blueGrey;
    } else if (15 < avgtemp && avgtemp <= 30) {
      return Colors.yellow;
    } else if (30 < avgtemp && avgtemp <= 40) {
      return Colors.orange;
    } else if (avgtemp > 40) {
      return Colors.red;
    } else {
      return Colors.lightBlue;
    }
  }
}
