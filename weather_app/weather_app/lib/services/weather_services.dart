import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "055c40ac0c2042a28fa161252221312";

  WeatherService({required this.dio});
  Future<WeatherModel> getWeatherService({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      return WeatherModel.fromjson(response.data);
    } on DioException catch (e) {
      if (e.response?.data["error"]["message"] ==
          "No matching location found.") {
        throw Exception("city Name is wrong");
      } else {
        throw Exception(
            e.response?.data["error"]["message"] ?? " oops there was an error");
      }
    } catch (e) {
      log(e.toString());
      throw Exception(" oops there was an error");
    }
  }
}
