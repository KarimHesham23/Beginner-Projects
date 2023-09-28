import 'package:flutter/material.dart';
import 'package:toku_app_3/models/item_model.dart';

import '../components/item.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});
  final List<ItemModels> colors = const [
    ItemModels(
        image: "assets/images/color/color_black.png",
        jData: "Kuro",
        eData: "black",
        sound: "sounds/colors/black.wav"),
    ItemModels(
        image: "assets/images/color/color_brown.png",
        jData: "Chairo",
        eData: "Brown",
        sound: "sounds/colors/brown.wav"),
    ItemModels(
        image: "assets/images/color/color_dusty_yellow.png",
        jData: "Hokori",
        eData: "Dusty yellow",
        sound: "sounds/colors/dusty yellow.wav"),
    ItemModels(
        image: "assets/images/color/color_gray.png",
        jData: "gurē",
        eData: "Gray",
        sound: "sounds/colors/gray.wav"),
    ItemModels(
        image: "assets/images/color/color_green.png",
        jData: "midori",
        eData: "Green",
        sound: "sounds/colors/green.wav"),
    ItemModels(
        image: "assets/images/color/color_red.png",
        jData: "aka",
        eData: "Red",
        sound: "sounds/colors/red.wav"),
    ItemModels(
        image: "assets/images/color/color_white.png",
        jData: "Shiroi ",
        eData: "White",
        sound: "sounds/colors/white.wav"),
    ItemModels(
        image: "assets/images/color/yellow.png",
        jData: " kiiro",
        eData: "Yellow",
        sound: "sounds/colors/yellow.wav"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Numbers"),
        backgroundColor: const Color(0xff7D40A2),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Item(
            number: colors[index],
            color: const Color(0xff7D40A2),
          );
        },
      ),
    );
  }
}
