import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/cubit_chat/chat_cubit.dart';
import 'package:chat_app/cubits/cubit_chat/chat_state.dart';
import 'package:chat_app/helper/show_message.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/messages_model.dart';
import 'package:chat_app/widgets/custom_bubble_chat.dart';
import 'package:chat_app/widgets/title_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  static String id = "Chat Page";

  ChatPage({super.key});

  TextEditingController controller = TextEditingController();

  final ScrollController _controller = ScrollController();
  String? valueMessage;
  List<MessagesModel> messagesList = [];
  String fromEmail = pref.getString("email")!;
  @override
  Widget build(BuildContext context) {
    String toEmail = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            )
          ],
          backgroundColor: primaryKey,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const TitleAppBar(text: "Chat")),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                messagesList = BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, value) {
                      return (messagesList[value].fromEmail == fromEmail)
                          ? CustomBubbleChat(
                              message: messagesList[value],
                              check: true,
                            )
                          : CustomBubbleChat(
                              message: messagesList[value],
                              check: false,
                            );
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context).addMessag(
                    value: value, fromEmail: fromEmail, toEmail: toEmail);
                controller.clear();
                listViewAnimateTo();
              },
              onChanged: (value) {
                valueMessage = value;
              },
              cursorColor: primaryKey,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (valueMessage == null) {
                        showMessage(context, message: "Enter Message Please");
                      } else {
                        BlocProvider.of<ChatCubit>(context).addMessag(
                            value: valueMessage!,
                            fromEmail: fromEmail,
                            toEmail: toEmail);
                        controller.clear();
                        listViewAnimateTo();
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: primaryKey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: primaryKey,
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  void listViewAnimateTo() {
    _controller.animateTo(
      0,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
}
