import 'package:flutter/material.dart';
import 'package:new_app_2/models/artical_model.dart';
import 'package:new_app_2/widgets/article_body_dialog.dart';

class ShowArticle extends StatelessWidget {
  const ShowArticle({super.key, required this.article});
  final ArticalModel article;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ArticleBody(
            artical: article,
          ), // bottom part
          Positioned(
            top: -100,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
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
            ), // top part
          ),
        ],
      ),
    );
  }
}
