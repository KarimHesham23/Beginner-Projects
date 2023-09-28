import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widgets/custom_item_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "home page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "New Trend",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            top: 80,
            left: 15,
            right: 16,
          ),
          child: FutureBuilder<List<ProductModel>>(
            future: GetAllProducts().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 100,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return CustomItemBox(item: snapshot.data![index]);
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
