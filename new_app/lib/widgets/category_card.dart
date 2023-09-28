import 'package:flutter/material.dart';
import 'package:new_app_2/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.category, required this.isActivale});
  final CategoryModel category;
  final bool isActivale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 14),
      child: isActivale
          ? Container(
              width: 204,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange, // Border color
                  width: 4, // Border width
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    category.image,
                  ),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  category.categoryName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : Container(
              height: 8,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    category.image,
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  category.categoryName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
    );
  }
}
