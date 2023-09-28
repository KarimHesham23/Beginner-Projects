import 'package:flutter/material.dart';

class NotFindData extends StatelessWidget {
  const NotFindData({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.shortestSide,
        child: const Center(
          child: Text(
            "Not Articles Find",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
