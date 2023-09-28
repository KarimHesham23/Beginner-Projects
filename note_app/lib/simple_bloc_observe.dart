import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserve implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("chane is $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("close");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("create");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
