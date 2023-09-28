import 'package:flutter/material.dart';
import 'package:new_app_2/models/get_news_model.dart';
import 'package:new_app_2/widgets/news_list_view.dart';
import 'package:new_app_2/widgets/not_find_data.dart';
import 'package:provider/provider.dart';

class NewsListViewbuilder extends StatefulWidget {
  const NewsListViewbuilder({super.key});

  @override
  State<NewsListViewbuilder> createState() => _NewsListViewbuilderState();
}

class _NewsListViewbuilderState extends State<NewsListViewbuilder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetNews>(context, listen: false)
          .fetchNews(context, "general");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetNews>(builder: (context, value, child) {
      return value.isLoading
          ? SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.shortestSide,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : value.getArticle().isEmpty
              ? const NotFindData()
              : const NewsListview();
    });
  }
}
