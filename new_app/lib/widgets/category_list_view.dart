import 'package:flutter/material.dart';
import 'package:new_app_2/models/category_model.dart';
import 'package:new_app_2/models/get_news_model.dart';
import 'package:new_app_2/widgets/category_card.dart';
import 'package:provider/provider.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int activateCounter = 0;
  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/images/general.jpeg',
      categoryName: 'general',
    ),
    CategoryModel(
      image: 'assets/images/bussiness.jpeg',
      categoryName: 'business',
    ),
    CategoryModel(
      image: 'assets/images/entertaiment.avif',
      categoryName: 'entertainment',
    ),
    CategoryModel(
      image: 'assets/images/health.avif',
      categoryName: 'health',
    ),
    CategoryModel(
      image: 'assets/images/science.avif',
      categoryName: 'science',
    ),
    CategoryModel(
      image: 'assets/images/technology.jpeg',
      categoryName: 'technology',
    ),
    CategoryModel(
      image: 'assets/images/sports.jpeg',
      categoryName: 'sports',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              activateCounter = index;
              Provider.of<GetNews>(context, listen: false)
                  .fetchNews(context, categories[index].categoryName);
              setState(() {});
            },
            child: CategoryCard(
              isActivale: activateCounter == index,
              category: categories[index],
            ),
          );
        },
      ),
    );
  }
}
