import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/cubit_login/login_cubit.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/bottom_page.dart';
import 'package:chat_app/widgets/custom_text_button.dart';
import 'package:chat_app/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  String? email;
  String? password;
  GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidate,
      key: fromKey,
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
                  "LOGIN",
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
              text: "Login",
              onTap: () async {
                if (fromKey.currentState!.validate()) {
                  fromKey.currentState!.save();
                  BlocProvider.of<LoginCubit>(context)
                      .siginInMethod(email: email!, password: password!);
                } else {
                  autoValidate = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            BottomPage(
              checkFrom: LoginPage.id,
            ),
          ],
        ),
      ),
    );
  }
}
