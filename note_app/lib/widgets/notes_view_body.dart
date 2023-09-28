import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/read_note_cubit/read_cubit.dart';
import 'package:note_app/views/search_view.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<ReadCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          CustomAppBar(
            onTap: () {
              Navigator.pushNamed(context, SearchView.id);
            },
            icon: Icons.search,
            name: "Notes",
          ),
          const Expanded(
            child: NotesListView(
              check: true,
            ),
          ),
        ],
      ),
    );
  }
}
