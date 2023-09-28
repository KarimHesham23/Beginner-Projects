import 'package:flutter/material.dart';
import 'package:toku_app_3/screens/colors_page.dart';
import 'package:toku_app_3/screens/family_page.dart';
import 'package:toku_app_3/screens/number_page.dart';
import 'package:toku_app_3/screens/phrases_page.dart';

import '../components/catogry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4D9),
      appBar: AppBar(
        backgroundColor: const Color(0xff49332A),
        title: const Text("Toku"),
      ),
      body: Column(
        children: [
          Catogry(
            name: "Numbers",
            color: const Color(0xffF99531),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NumberPage();
                  },
                ),
              );
            },
          ),
          Catogry(
            name: "Family Members",
            color: const Color(0xff528032),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const FamilyPage();
                  },
                ),
              );
            },
          ),
          Catogry(
            name: "Colors",
            color: const Color(0xff7D40A2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ColorsPage();
                  },
                ),
              );
            },
          ),
          Catogry(
            name: "Phrases",
            color: const Color(0xff47A5CB),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PhrasesPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
