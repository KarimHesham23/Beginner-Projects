import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/read_note_cubit/read_cubit.dart';
import 'package:note_app/helpers/bottom_message.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  TextEditingController title = TextEditingController();

  TextEditingController content = TextEditingController();
  String? titleChange;
  String? contentChange;

  @override
  void initState() {
    title.text = widget.note.title;
    content.text = widget.note.content;
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
              widget.note.title = titleChange ?? widget.note.title;
              widget.note.content = contentChange ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<ReadCubit>(context).getNotes();
              bottomMessage(context,
                  message: "${widget.note.title} edit success");
              Navigator.pop(context);
            },
            icon: Icons.done,
            name: "Edit Note",
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextFormField(
            controller: title,
            onChange: (p0) {
              titleChange = p0;
            },
            hintText: "Title",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            onChange: (p0) {
              contentChange = p0;
            },
            controller: content,
            hintText: "Content",
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
