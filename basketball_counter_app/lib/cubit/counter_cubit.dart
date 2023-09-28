import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(super.initialState);
  int teamAPoints = 0;
  int teamBPoints = 0;
  void incrementPoints({required String team, int points = 0}) {
    if (team == "A") {
      teamAPoints += points;
      emit(CounterAIncrementState());
    } else if (team == "B") {
      teamBPoints += points;
      emit(CounterBIncrementState());
    } else {
      teamAPoints = 0;
      teamBPoints = 0;
      emit(CounterRIncrementState());
    }
  }
}
