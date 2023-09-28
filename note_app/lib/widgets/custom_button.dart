import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/add_note_cubit/add_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: BlocBuilder<AddCubit, AddState>(
            builder: (context, state) {
              return Center(
                child: state is AddLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ))
                    : const Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
              );
            },
          ),
        ));
  }
}
