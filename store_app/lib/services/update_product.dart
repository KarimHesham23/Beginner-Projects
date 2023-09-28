import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        // ignore: missing_required_param
        await Api().put(url: "https://fakestoreapi.com/products/$id", body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    });
    return ProductModel.fromjson(data);
  }
}
