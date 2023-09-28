import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.icon, required this.name, this.onTap});
  final IconData icon;
  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(0.05),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 28,
                ),
              )),
        ),
      ],
    );
  }
}
