import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weather;

  Future<void> getWeather({required String cityName}) async {
    try {
      emit(WeatherLoading());
      weather = await WeatherService(dio: Dio())
          .getWeatherService(cityName: cityName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFaileur(errorMessage: e.toString().substring(11)));
    }
  }
}
