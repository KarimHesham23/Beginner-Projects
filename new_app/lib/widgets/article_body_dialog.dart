import 'package:flutter/material.dart';
import 'package:new_app_2/models/artical_model.dart';

class ArticleBody extends StatelessWidget {
  const ArticleBody({super.key, required this.artical});
  final ArticalModel artical;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 20, top: 45 + 20, right: 20, bottom: 20),
      margin: const EdgeInsets.only(top: 45),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            artical.title ?? "Not Found, sorry",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            artical.subTitle ?? "Not Found, sorry",
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 22,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "return",
                  style: TextStyle(fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}
