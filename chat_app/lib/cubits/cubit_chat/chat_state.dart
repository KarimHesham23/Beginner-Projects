import 'package:chat_app/models/messages_model.dart';

abstract class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSuccess extends ChatState {
  List<MessagesModel> messageList;
  ChatSuccess({required this.messageList});
}
