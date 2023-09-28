import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());

  Color color = const Color(0xffFF5714);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddLoading());
    try {
      await Hive.box<NoteModel>(kNotesBox).add(note);
      emit(AddSuccess());
    } catch (e) {
      // print(" this is error ${e.toString()}"); // delete this later
      emit(Addfaileur(errorMessage: e.toString()));
    }
  }
}
