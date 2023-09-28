import 'package:flutter/material.dart';

class Catogry extends StatelessWidget {
  const Catogry(
      {super.key,
      required this.name,
      required this.color,
      required this.onTap});
  final String name;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 60,
        color: color,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Text(
            name,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
