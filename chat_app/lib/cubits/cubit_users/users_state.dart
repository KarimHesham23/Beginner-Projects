part of 'users_cubit.dart';

sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class Usersfaileur extends UsersState {
  final String errorMessage;
  Usersfaileur({required this.errorMessage});
}

final class UsersSuccess extends UsersState {
  final List<UserModel> usersList;
  UsersSuccess({required this.usersList});
}
