import 'package:flutter/material.dart';

class NoWeatherData extends StatelessWidget {
  const NoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        Text(
          "There is no weather 😔 start",
          style: TextStyle(fontSize: 24),
        ),
        Text(
          "Searching now 🔍",
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
