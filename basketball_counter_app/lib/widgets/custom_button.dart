import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.task});
  final String text;
  final Function() task;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: task,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFF9900),
          minimumSize: const Size(150, 50)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
