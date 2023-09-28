part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {}

final class WeatherFaileur extends WeatherState {
  final String errorMessage;
  WeatherFaileur({required this.errorMessage});
}

final class WeatherLoading extends WeatherState {}
