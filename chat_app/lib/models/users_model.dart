import 'package:chat_app/constants.dart';

class UserModel {
  final String uid;
  final String name;
  final String status;
  UserModel({required this.uid, required this.name, required this.status});
  factory UserModel.fromjson(jsonData) {
    return UserModel(
        uid: jsonData[kUserid],
        name: jsonData[kUserName],
        status: jsonData[kUserStatus]);
  }
}
