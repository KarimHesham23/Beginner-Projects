import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit_weather/weather_cubit.dart';
import 'package:weather_app/widgets/custom_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = "Search View";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: CustomTextField(
            hintText: "Enter City Name",
            onPressed: () {},
            onSubmitted: (p0) {
              BlocProvider.of<WeatherCubit>(context, listen: false)
                  .getWeather(cityName: p0);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
