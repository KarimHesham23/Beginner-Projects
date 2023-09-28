import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit_weather/weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/search_view.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(),
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch:
                  BlocProvider.of<WeatherCubit>(context).weather?.getcolor() ??
                      Colors.lightBlue),
          debugShowCheckedModeBanner: false,
          routes: {
            HomeView.id: (context) => const HomeView(),
            SearchView.id: (context) => const SearchView(),
          },
          initialRoute: HomeView.id,
        );
      },
    );
  }
}
