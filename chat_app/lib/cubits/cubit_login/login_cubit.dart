import 'package:chat_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> siginInMethod(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
      pref.setString("email", email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously

        emit(LoginFaileur(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        emit(LoginFaileur(
            errorMessage: 'Wrong password provided for that user.'));
      }
    }
  }
  // ignore: use_build_context_synchronously
}
