import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/cubit_weather/weather_cubit.dart';
import 'package:weather_app/helpers/show_messages.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "Home Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchView.id);
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherFaileur) {
            showMessage(context, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          return state is WeatherLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const HomeViewBody();
        },
      ),
    );
  }
}
