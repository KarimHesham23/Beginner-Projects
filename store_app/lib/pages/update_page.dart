import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static String id = "Update Page";

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? title, description, image;

  dynamic price;
  bool isAsynCall = false;

  @override
  Widget build(BuildContext context) {
    ProductModel item =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isAsynCall,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Page",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 140,
                ),
                CustomTextField(
                  hintText: "Title",
                  onChange: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Description",
                  onChange: (value) {
                    description = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Image",
                  onChange: (value) {
                    image = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboradtype: TextInputType.number,
                  hintText: "Price",
                  onChange: (value) {
                    price = value;
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomTextButton(
                  text: "submit",
                  onTap: () {
                    setState(() {
                      isAsynCall = true;
                    });
                    try {
                      updateItem(item);
                      print("suc");
                    } catch (e) {
                      print(e.toString());
                    }
                    setState(() {
                      isAsynCall = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateItem(ProductModel item) async {
    await UpdateProduct().updateProduct(
      id: item.id,
      title: title == null ? item.title : title!,
      price: price ?? item.price.toString(),
      description: description == null ? item.description : description!,
      image: image == null ? item.image : image!,
      category: item.category,
    );
  }
}
