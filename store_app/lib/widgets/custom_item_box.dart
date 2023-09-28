import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_page.dart';

class CustomItemBox extends StatelessWidget {
  const CustomItemBox({super.key, required this.item});
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              // spreadRadius: 5,
              offset: Offset.fromDirection(7, 10),
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
            ),
          ]),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, UpdatePage.id, arguments: item);
            },
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      item.title.substring(0, 6),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r"$" + item.price.toString()),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: -60,
          child: Image.network(
            item.image,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
