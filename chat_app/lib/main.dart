import 'package:chat_app/cubits/cubit_chat/chat_cubit.dart';
import 'package:chat_app/cubits/cubit_login/login_cubit.dart';
import 'package:chat_app/cubits/cubit_register/register_cubit.dart';
import 'package:chat_app/cubits/cubit_users/users_cubit.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/pages/users_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'pages/login_page.dart';

late SharedPreferences pref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  pref = await SharedPreferences.getInstance();
  runApp(const ScholarApp());
}

class ScholarApp extends StatelessWidget {
  const ScholarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => UsersCubit()),
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => const LoginPage(),
          RegisterPage.id: (context) => const RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
          UsersPage.id: (context) => const UsersPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute:
            pref.getString("email") == null ? LoginPage.id : UsersPage.id,
      ),
    );
  }
}
