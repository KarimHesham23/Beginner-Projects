part of 'read_cubit.dart';

sealed class ReadState {}

final class ReadInitial extends ReadState {}

final class ReadSuccess extends ReadState {}
