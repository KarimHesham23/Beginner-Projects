import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatelessWidget {
  const BottomPage({super.key, required this.checkFrom});
  final String checkFrom;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          checkFrom == LoginPage.id
              ? "don't have an account ? "
              : "Already have an account ? ",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (checkFrom == LoginPage.id) {
              Navigator.pushNamed(context, RegisterPage.id);
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            checkFrom == LoginPage.id ? "Register" : "Login",
            style: const TextStyle(
              color: Color(0xff7D9DAD),
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
