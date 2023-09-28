import 'package:flutter/material.dart';
import 'package:toku_app_3/components/item_phrases.dart';

import '../models/item_phrease_model.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({super.key});
  final List<ItemPhrasesModels> phrases = const [
    ItemPhrasesModels(
      jData: "Kōdoku suru koto o wasurenaide kudasa",
      eData: "don't forget to subscribe",
      sound: "sounds/phrases/dont_forget_to_subscribe.wav",
    ),
    ItemPhrasesModels(
      jData: "Kimasu ka",
      eData: "are you coming",
      sound: "sounds/phrases/are_you_coming.wav",
    ),
    ItemPhrasesModels(
      jData: "Go kibun wa ikagadesu ka.",
      eData: "how are you feeling",
      sound: "sounds/phrases/how_are_you_feeling.wav",
    ),
    ItemPhrasesModels(
      jData: "Watashi wa anime ga daisukidesu",
      eData: "i love anime",
      sound: "sounds/phrases/i_love_anime.wav",
    ),
    ItemPhrasesModels(
      jData: "Watashi wa puroguramingu ga ",
      eData: "i love programming",
      sound: "sounds/phrases/i_love_programming.wav",
    ),
    ItemPhrasesModels(
      jData: "Puroguramingu wa kantandesu",
      eData: "programming is easy",
      sound: "sounds/phrases/programming_is_easy.wav",
    ),
    ItemPhrasesModels(
      jData: "Anata no namae wa nandesuka",
      eData: "what is your name",
      sound: "sounds/phrases/what_is_your_name.wav",
    ),
    ItemPhrasesModels(
      jData: "Doko ni iku no",
      eData: "where are you going",
      sound: "sounds/phrases/where_are_you_going.wav",
    ),
    ItemPhrasesModels(
      jData: "Hai, ikimasu",
      eData: "yes i'm coming",
      sound: "sounds/phrases/yes_im_coming.wav",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Numbers"),
        backgroundColor: const Color(0xff47A5CB),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return ItemPhrases(
            data: phrases[index],
            color: const Color(0xff47A5CB),
          );
        },
      ),
    );
  }
}
