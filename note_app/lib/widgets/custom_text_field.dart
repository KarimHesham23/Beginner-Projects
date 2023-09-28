import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      this.onSave,
      this.controller,
      this.onChange});
  final String hintText;
  final int maxLines;
  final Function(String?)? onSave;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field Required";
        } else {
          return null;
        }
      },
      onSaved: onSave,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kPrimaryColor),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(color: kPrimaryColor)),
    );
  }

  OutlineInputBorder buildBorder({Color color = Colors.white}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
