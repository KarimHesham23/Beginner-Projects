import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategory {
  Future<List<dynamic>> getCategory({required String categoryNamed}) async {
    List<dynamic> data = await Api()
        // ignore: missing_required_param
        .get(url: "https://fakestoreapi.com/products/category/$categoryNamed");
    List<ProductModel> categoryProducts = [];
    for (int i = 0; i < data.length; i++) {
      categoryProducts.add(ProductModel.fromjson(data[i]));
    }
    return categoryProducts;
  }
}
