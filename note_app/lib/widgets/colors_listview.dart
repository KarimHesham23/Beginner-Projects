import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/add_note_cubit/add_cubit.dart';

import 'custom_color_item.dart';

class ColorsListview extends StatefulWidget {
  const ColorsListview({super.key});

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  int activecounter = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kcolorlist.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                activecounter = index;
                BlocProvider.of<AddCubit>(context).color = kcolorlist[index];
                setState(() {});
              },
              child: ColorItem(
                coloritem: kcolorlist[index],
                isactive: activecounter == index,
              ));
        },
      ),
    );
  }
}
