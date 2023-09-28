import 'package:flutter/material.dart';
import 'package:toku_app_3/models/item_model.dart';
import '../components/item.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});
  final List<ItemModels> familyMembers = const [
    ItemModels(
        image: "assets/images/family/family_daughter.png",
        jData: "Musume",
        eData: "Daughter",
        sound: "sounds/family_members/daughter.wav"),
    ItemModels(
        image: "assets/images/family/family_father.png",
        jData: "Chichioya",
        eData: "Father",
        sound: "sounds/family_members/father.wav"),
    ItemModels(
        image: "assets/images/family/family_grandfather.png",
        jData: "Ojīsan",
        eData: "Grandfather",
        sound: "sounds/family_members/grand father.wav"),
    ItemModels(
        image: "assets/images/family/family_grandmother.png",
        jData: "Sobo",
        eData: "Grandmother",
        sound: "sounds/family_members/grand mother.wav"),
    ItemModels(
        image: "assets/images/family/family_mother.png",
        jData: "Hahaoya",
        eData: "Mother",
        sound: "sounds/family_members/mother.wav"),
    ItemModels(
        image: "assets/images/family/family_older_brother.png",
        jData: "Nīsan",
        eData: "Older Brother",
        sound: "sounds/family_members/older brother.wav"),
    ItemModels(
        image: "assets/images/family/family_older_sister.png",
        jData: "Onēsan",
        eData: "Older Sister",
        sound: "sounds/family_members/older sister.wav"),
    ItemModels(
        image: "assets/images/family/family_son.png",
        jData: "Musuko",
        eData: "Son",
        sound: "sounds/family_members/son.wav"),
    ItemModels(
        image: "assets/images/family/family_younger_brother.png",
        jData: "Otōto",
        eData: "Younger Brother",
        sound: "sounds/family_members/younger brother.wav"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Numbers"),
        backgroundColor: const Color(0xff528032),
      ),
      body: ListView.builder(
        itemCount: familyMembers.length,
        itemBuilder: (context, index) {
          return Item(
            number: familyMembers[index],
            color: const Color(0xff528032),
          );
        },
      ),
    );
  }
}
