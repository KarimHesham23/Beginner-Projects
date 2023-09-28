import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/cubit_chat/chat_state.dart';
import 'package:chat_app/models/messages_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  List<MessagesModel> messagesList = [];
  void addMessag(
      {required String value,
      required String fromEmail,
      required String toEmail}) {
    message.add(
      {
        kMessage: value,
        kCreateAt: DateTime.now(),
        kFromId: fromEmail,
        kToId: toEmail
      },
    );
  }

  void getMessage({required String fromEmail, required String toEmail}) {
    message.orderBy(kCreateAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var element in event.docs) {
        if ((element[kFromId] == fromEmail && element[kToId] == toEmail) ||
            (element[kFromId] == toEmail && element[kToId] == fromEmail)) {
          messagesList.add(MessagesModel.fromjson(element));
        } else {
          continue;
        }
      }
      emit(ChatSuccess(messageList: messagesList));
    });
  }
}
