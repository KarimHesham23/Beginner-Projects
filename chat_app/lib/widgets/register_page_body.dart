import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/cubit_register/register_cubit.dart';
import 'package:chat_app/cubits/cubit_users/users_cubit.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/bottom_page.dart';
import 'package:chat_app/widgets/custom_text_button.dart';
import 'package:chat_app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  String? email;
  String? name;
  String? password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> fromkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: fromkey,
      child: Padding(
        padding: EdgeInsets.only(
            right: 8.0,
            left: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 0),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              kLogo,
              height: 120,
              width: 180,
            ),
            const Center(
              child: Text(
                "Scholar Chat",
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Row(
              children: [
                Text(
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              check: true,
              hintText: "name",
              onSaved: (p0) {
                name = p0;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              check: true,
              hintText: "Email",
              onSaved: (p0) {
                email = p0;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              check: false,
              hintText: "Password",
              onSaved: (p0) {
                password = p0;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextButton(
              text: "Register",
              onTap: () async {
                if (fromkey.currentState!.validate()) {
                  fromkey.currentState!.save();
                  BlocProvider.of<RegisterCubit>(context)
                      .registerMethods(email: email!, password: password!);
                  BlocProvider.of<UsersCubit>(context)
                      .addUser(email: email!, name: name!);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            BottomPage(checkFrom: RegisterPage.id),
          ],
        ),
      ),
    );
  }
}
