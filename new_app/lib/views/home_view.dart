import 'package:flutter/material.dart';
import 'package:new_app_2/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "Home Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News ",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                color: Colors.orange,
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const HomewBody(),
    );
  }
}
