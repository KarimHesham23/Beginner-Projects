import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  String? useEmail;
  Future<void> registerMethods(
      {required String email, required String password}) async {
    try {
      emit(RegisterLoading());
      useEmail = email;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFaileur(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFaileur(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFaileur(errorMessage: "error in registeration"));
    }
  }
}
