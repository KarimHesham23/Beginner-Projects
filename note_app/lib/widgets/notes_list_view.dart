import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/read_note_cubit/read_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.check});
  final bool check; // will from searchVew if false , and from notesview if true

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: BlocBuilder<ReadCubit, ReadState>(
        builder: (context, state) {
          List<NoteModel> notes = check
              ? BlocProvider.of<ReadCubit>(context).notes
              : BlocProvider.of<ReadCubit>(context).results;
          return ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, value) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomNoteItem(note: notes[value]),
              );
            },
          );
        },
      ),
    );
  }
}
