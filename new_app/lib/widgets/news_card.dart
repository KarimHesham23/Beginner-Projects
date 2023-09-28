import 'package:flutter/material.dart';
import 'package:new_app_2/models/artical_model.dart';
import 'package:new_app_2/widgets/show_article.dart';
// import 'package:new_app_2/widgets/show_article.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final ArticalModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => ShowArticle(
                article: article,
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: article.image == null
                ? Image.asset(
                    "assets/images/sports.jpeg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    article.image!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          article.title ?? "karim hesham hassan ",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          article.subTitle ?? "very bad api",
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
