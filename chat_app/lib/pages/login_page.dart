import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/cubit_login/login_cubit.dart';
import 'package:chat_app/helper/show_message.dart';
import 'package:chat_app/pages/users_page.dart';
import 'package:chat_app/widgets/login_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  static String id = "Login Page";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
        } else if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, UsersPage.id);
        } else if (state is LoginFaileur) {
          showMessage(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: const Scaffold(
            backgroundColor: primaryKey,
            body: LoginPageBody(),
          ),
        );
      },
    );
  }
}
