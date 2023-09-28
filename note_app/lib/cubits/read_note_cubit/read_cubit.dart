import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'read_state.dart';

class ReadCubit extends Cubit<ReadState> {
  ReadCubit() : super(ReadInitial());
  List<NoteModel> notes = [];
  List<NoteModel> results = [];
  String p0 = "";

  getNotes() {
    notes = Hive.box<NoteModel>(kNotesBox).values.toList();
    results = notes;
    emit(ReadSuccess());
  }

  getNotesSearch(String title) {
    if (title.isEmpty) {
      results = notes;
    } else {
      p0 = title;
      results = notes
          .where(
              (user) => user.title.toLowerCase().contains(title.toLowerCase()))
          .toList();
    }
    emit(ReadSuccess());
  }
}
