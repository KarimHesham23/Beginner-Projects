import 'package:chat_app/cubits/cubit_register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onSaved,
    required this.check,
    this.controller,
  });
  final String hintText;
  final Function(String?) onSaved;
  final bool check;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          // TextEditingController(
          //     text: !check
          //         ? null
          //         : BlocProvider.of<RegisterCubit>(context).useEmail),
          obscureText: !check,
          validator: (value) {
            if (check) {
              final regex = RegExp(
                  r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
              final valid = regex.hasMatch(value ?? "");
              if (!valid && hintText == "Email") {
                return "It's wrong email";
              } else if (value?.isEmpty ?? false) {
                return "filed Required";
              }
            } else {
              if (value?.isEmpty ?? false) {
                return "Must find password";
              } else if (value!.length < 4) {
                return "Password must large than 4";
              }
            }
            return null;
          },
          onSaved: onSaved,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
