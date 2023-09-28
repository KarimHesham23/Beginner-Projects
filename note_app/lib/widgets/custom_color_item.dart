import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isactive, required this.coloritem});
  final bool isactive;
  final Color coloritem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: isactive
          ? CircleAvatar(
              radius: 36,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 32,
                backgroundColor: coloritem,
              ),
            )
          : CircleAvatar(
              radius: 32,
              backgroundColor: coloritem,
            ),
    );
  }
}
