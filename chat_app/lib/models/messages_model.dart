import 'package:chat_app/constants.dart';

class MessagesModel {
  final String content;
  final String fromEmail;
  final String toEmail;
  MessagesModel(
      {required this.content, required this.fromEmail, required this.toEmail});
  factory MessagesModel.fromjson(jsonData) {
    return MessagesModel(
        content: jsonData[kMessage],
        fromEmail: jsonData[kFromId],
        toEmail: jsonData[kToId]);
  }
}
