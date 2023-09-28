import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
  factory ProductModel.fromjson(jsondata) {
    return ProductModel(
      id: jsondata["id"],
      title: jsondata["title"],
      price: jsondata["price"],
      description: jsondata["description"],
      category: jsondata["category"],
      image: jsondata["image"],
      rating: jsondata["rating"] == null
          ? null
          : RatingModel.fromjson(
              jsondata["rating"],
            ),
    );
  }
}
