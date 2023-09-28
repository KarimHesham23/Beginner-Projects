import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_listview.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class FormToAddNote extends StatefulWidget {
  const FormToAddNote({super.key});

  @override
  State<FormToAddNote> createState() => _FormToAddNoteState();
}

GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode validate = AutovalidateMode.disabled;
String? title;
String? content;

class _FormToAddNoteState extends State<FormToAddNote> {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: validate,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            hintText: "title",
            onSave: (p0) {
              title = p0;
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            onSave: (p0) {
              content = p0;
            },
            hintText: "content",
            maxLines: 6,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: ColorsListview(),
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                NoteModel note = NoteModel(
                    title: title!,
                    content: content!,
                    date: formatDate(DateTime.now()),
                    color: Colors.red.value);
                BlocProvider.of<AddCubit>(context).addNote(note);
              } else {
                validate = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    final outputFormat = DateFormat('MMMM d, yyyy');
    final formattedDate = outputFormat.format(date);
    return formattedDate;
  }
}
