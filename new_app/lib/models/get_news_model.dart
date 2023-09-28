import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:new_app_2/helpers/show_message.dart';
import 'package:new_app_2/models/artical_model.dart';
import 'package:new_app_2/service/get_news_services.dart';

class GetNews extends ChangeNotifier {
  List<ArticalModel> _articles = [];
  bool isLoading = false;

  fetchNews(BuildContext context, String category) async {
    isLoading = true;
    notifyListeners();
    try {
      _articles = await GetNewsServices(Dio()).getNews(category);
      isLoading = false;
      if (_articles.isEmpty) {
        // ignore: use_build_context_synchronously
        show(context, "There is no news");
      }
      notifyListeners();
    } catch (e) {
      // ignore: use_build_context_synchronously
      show(context, e.toString());
    }
  }

  void show(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        showMessage(context, message: message);
      },
    );
  }

  List<ArticalModel> getArticle() {
    return _articles;
  }
}
