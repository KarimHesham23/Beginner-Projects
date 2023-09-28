import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit_weather/weather_cubit.dart';
import 'package:weather_app/widgets/no_weather_data.dart';
import 'package:weather_app/widgets/weather_data.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<WeatherCubit>(context).weather == null
        ? const NoWeatherData()
        : WeatherData(weather: BlocProvider.of<WeatherCubit>(context).weather!);
  }
}
