import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/cubit_chat/chat_cubit.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/users_model.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ChatCubit>(context, listen: false)
            .getMessage(fromEmail: pref.getString("email")!, toEmail: user.uid);
        Navigator.pushNamed(context, ChatPage.id, arguments: user.uid);
      },
      child: Card(
        shadowColor: primaryKey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 2,
        child: ListTile(
          title: Text(
            user.name,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            user.uid,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
