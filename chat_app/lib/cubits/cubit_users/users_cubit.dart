import 'package:chat_app/constants.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  CollectionReference user = FirebaseFirestore.instance.collection("users");
  List<UserModel> usersList = [];
  Future<void> addUser({required String email, required String name}) {
    return user
        .add({
          kUserid: email,
          kUserName: name,
          kUserStatus: "avaliable",
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> getUsers() async {
    emit(UsersLoading());
    try {
      QuerySnapshot querySnapshot = await user.get();
      usersList.clear();
      for (var element in querySnapshot.docs) {
        if (element[kUserid] == pref.getString("email")) {
          continue;
        } else {
          usersList.add(UserModel.fromjson(element));
        }
      }
      emit(UsersSuccess(usersList: usersList));
    } catch (e) {
      emit(Usersfaileur(
          errorMessage: 'Error retrieving data from Firestore: $e'));
    }
  }
}
