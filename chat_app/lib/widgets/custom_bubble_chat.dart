import 'package:chat_app/models/messages_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomBubbleChat extends StatelessWidget {
  const CustomBubbleChat({
    super.key,
    required this.message,
    required this.check,
  });
  final MessagesModel message;
  final bool
      check; // if check equal true built bubble chat friend else build bubble chat friend

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (check) ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          right: 12,
          left: 12,
        ),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(34),
              topRight: const Radius.circular(34),
              bottomRight: Radius.circular((check) ? 34 : 0),
              bottomLeft: Radius.circular((check) ? 0 : 34)),
          color: (check) ? primaryKey : kChatFriend,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 18,
          ),
          child: Text(
            message.content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
