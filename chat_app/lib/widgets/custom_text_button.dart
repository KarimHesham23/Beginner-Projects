import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              color: primaryKey,
            ),
          ),
        ));
  }
}
