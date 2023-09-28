import 'package:flutter/material.dart';
import 'package:new_app_2/models/get_news_model.dart';
import 'package:new_app_2/widgets/news_card.dart';
import 'package:provider/provider.dart';

class NewsListview extends StatelessWidget {
  const NewsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: Provider.of<GetNews>(context).getArticle().length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: NewsCard(
            article: Provider.of<GetNews>(context).getArticle()[index],
          ),
        );
      },
    );
  }
}
