import 'package:dio/dio.dart';
import 'package:new_app_2/constatns.dart';
import 'package:new_app_2/models/artical_model.dart';
// import 'package:new_app_2/models/artical_model.dart';

class GetNewsServices {
  final Dio dio;
  GetNewsServices(this.dio);

  Future<List<ArticalModel>> getNews(String category) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=$kApiKey&category=$category");
      List<dynamic> data = response.data["articles"];
      List<ArticalModel> articles = [];
      for (int i = 0; i < data.length; i++) {
        articles.add(ArticalModel.fromjson(data[i]));
      }
      return articles;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
