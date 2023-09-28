import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: "https://fakestoreapi.com/products");

    List<ProductModel> allProducts = [];
    for (int i = 0; i < data.length; i++) {
      allProducts.add(ProductModel.fromjson(data[i]));
    }
    return allProducts;
  }
}
