import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/read_note_cubit/read_cubit.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/notes_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

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
              Navigator.pop(context);
            },
            icon: Icons.arrow_back,
            name: "Search",
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextFormField(
            onChange: (p0) =>
                BlocProvider.of<ReadCubit>(context).getNotesSearch(p0),
            hintText: "search",
          ),
          const Expanded(
            child: NotesListView(
              check: false,
            ),
          ),
        ],
      ),
    );
  }
}
