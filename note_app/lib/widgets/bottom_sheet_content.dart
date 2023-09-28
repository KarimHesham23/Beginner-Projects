import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_cubit.dart';
import 'package:note_app/cubits/read_note_cubit/read_cubit.dart';
import 'package:note_app/helpers/bottom_message.dart';
import 'package:note_app/widgets/form_to_add_note.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          if (state is Addfaileur) {
            bottomMessage(context, message: " try add again");
          } else if (state is AddSuccess) {
            BlocProvider.of<ReadCubit>(context).getNotes();
            bottomMessage(context, message: "Note add success");
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddLoading ? true : false,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    top: 0),
                child: const FormToAddNote(),
              ),
            ),
          );
        },
      ),
    );
  }
}
