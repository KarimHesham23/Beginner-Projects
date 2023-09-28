part of 'add_cubit.dart';

sealed class AddState {}

final class AddInitial extends AddState {}

final class AddLoading extends AddState {}

final class AddSuccess extends AddState {}

final class Addfaileur extends AddState {
  final String errorMessage;
  Addfaileur({required this.errorMessage});
}
