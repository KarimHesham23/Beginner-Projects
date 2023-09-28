import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onPressed,
    required this.onSubmitted,
  });
  final String hintText;
  final void Function() onPressed;
  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.search),
        ),
        label: const Text(
          "Search",
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(7),
        // ),
      ),
    );
  }
}
