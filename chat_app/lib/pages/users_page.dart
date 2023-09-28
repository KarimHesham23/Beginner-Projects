import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/cubit_users/users_cubit.dart';
import 'package:chat_app/helper/show_message.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/title_app_bar.dart';
import 'package:chat_app/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});
  static String id = "users id";

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<UsersCubit>(context, listen: false).getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              pref.clear();
              Navigator.pushReplacementNamed(context, LoginPage.id);
            },
            icon: const Icon(Icons.logout),
          )
        ],
        backgroundColor: primaryKey,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const TitleAppBar(
          text: "People",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 12, left: 12, bottom: 5),
        child: BlocConsumer<UsersCubit, UsersState>(
          listener: (context, state) {
            if (state is Usersfaileur) {
              showMessage(context, message: state.errorMessage);
            }
          },
          builder: (context, state) {
            return state is UsersLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount:
                        BlocProvider.of<UsersCubit>(context).usersList.length,
                    itemBuilder: (context, index) {
                      return UserCard(
                        user: BlocProvider.of<UsersCubit>(context)
                            .usersList[index],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
