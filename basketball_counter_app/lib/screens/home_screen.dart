import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Points counter"),
            backgroundColor: const Color(0xffFF9900),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 500,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Team A",
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              Text(
                                BlocProvider.of<CounterCubit>(context)
                                    .teamAPoints
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 150,
                                ),
                              ),
                              CustomButton(
                                  text: "add 1 point",
                                  task: () {
                                    BlocProvider.of<CounterCubit>(context)
                                        .incrementPoints(team: "A", points: 1);
                                  }),
                              CustomButton(
                                  text: "add 2 points",
                                  task: () {
                                    BlocProvider.of<CounterCubit>(context)
                                        .incrementPoints(team: "A", points: 2);
                                  }),
                              CustomButton(
                                  text: "add 3 points",
                                  task: () {
                                    BlocProvider.of<CounterCubit>(context)
                                        .incrementPoints(team: "A", points: 3);
                                  }),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                          indent: 30,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Team B",
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              Text(
                                BlocProvider.of<CounterCubit>(context)
                                    .teamBPoints
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 150,
                                ),
                              ),
                              CustomButton(
                                  text: "add 1 point",
                                  task: () {
                                    BlocProvider.of<CounterCubit>(context)
                                        .incrementPoints(team: "B", points: 1);
                                  }),
                              CustomButton(
                                  text: "add 2 points",
                                  task: () {
                                    BlocProvider.of<CounterCubit>(context)
                                        .incrementPoints(team: "B", points: 2);
                                  }),
                              CustomButton(
                                  text: "add 3 points",
                                  task: () {
                                    BlocProvider.of<CounterCubit>(context)
                                        .incrementPoints(team: "B", points: 3);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  text: "reset",
                  task: () {
                    BlocProvider.of<CounterCubit>(context)
                        .incrementPoints(team: "R");
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
