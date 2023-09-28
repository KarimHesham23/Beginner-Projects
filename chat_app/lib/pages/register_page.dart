import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/cubit_register/register_cubit.dart';
import 'package:chat_app/widgets/register_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_message.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  static String id = "Register Page";

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
        } else if (state is RegisterSuccess) {
          showMessage(context, message: "sucess");
          Navigator.pop(context);
        } else if (state is RegisterFaileur) {
          showMessage(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading,
          child: const Scaffold(
            backgroundColor: primaryKey,
            body: RegisterPageBody(),
          ),
        );
      },
    );
  }
}
