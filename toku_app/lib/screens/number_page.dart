import 'package:flutter/material.dart';
import 'package:toku_app_3/components/item.dart';
import 'package:toku_app_3/models/item_model.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});
  final List<ItemModels> numbers = const [
    ItemModels(
      image: "assets/images/Numbers/number_one.png",
      jData: "ichi",
      eData: "One",
      sound: "sounds/numbers/number_one_sound.mp3",
    ),
    ItemModels(
        image: "assets/images/Numbers/number_two.png",
        jData: "Ni",
        eData: "Two",
        sound: "sounds/numbers/number_two_sound.mp3"),
    ItemModels(
        image: "assets/images/Numbers/number_three.png",
        jData: "San",
        eData: "Three",
        sound: "sounds/numbers/number_three_sound.mp3"),
    ItemModels(
        image: "assets/images/Numbers/number_four.png",
        jData: "Shi",
        eData: "Four",
        sound: "sounds/numbers/number_four_sound.mp3"),
    ItemModels(
        image: "assets/images/Numbers/number_five.png",
        jData: "Go",
        eData: "Five",
        sound: "sounds/numbers/number_five_sound.mp3"),
    ItemModels(
        image: "assets/images/Numbers/number_six.png",
        jData: "Roku",
        eData: "Six",
        sound: "sounds/numbers/number_six_sound.mp3"),
    ItemModels(
        image: "assets/images/Numbers/number_seven.png",
        jData: "Sebun",
        eData: "Seven",
        sound: "sounds/numbers/number_seven_sound.mp3"),
    ItemModels(
        image: "assets/images/Numbers/number_eight.png",
        jData: "hachi",
        eData: "Eight",
        sound: "sounds/numbers/number_eight_sound.mp3"),
    ItemModels(
        image: "assets/images/Numbers/number_nine.png",
        jData: "Ku",
        eData: "Nine",
        sound: "sounds/numbers/number_nine_sound.mp3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffFFF4D9),
      appBar: AppBar(
        title: const Text("Numbers"),
        backgroundColor: const Color(0xff49332A),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Item(
            number: numbers[index],
            color: const Color(0xffF99531),
          );
        },
      ),
    );
  }
}
