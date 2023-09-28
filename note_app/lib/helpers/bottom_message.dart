import 'package:flutter/material.dart';

import '../constants.dart';

void bottomMessage(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kPrimaryColor,
      content: Text(
        message,
        style: const TextStyle(fontSize: 18),
      ),
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(milliseconds: 1500),
    ),
  );
}
