import 'package:fitness_app_ui/logic/cubit/choose_exercise/exercise_state.dart';
import 'package:fitness_app_ui/logic/cubit/exercise_detail/excise_detail_state.dart';
import 'package:fitness_app_ui/logic/cubit/exercise_detail/exercise_detail_cubit.dart';
import 'package:fitness_app_ui/pages/exercises/show_excersice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/custom_counter.dart';

class SelectExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Select your exercise for today: ",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ExerciseDetailCubit, ExerciseDetailState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.excersiceCheckList?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ShowExcercise(
                                          gifUrl: state
                                              .excersiceCheckList![index]
                                              .gifUrl!,
                                          excersiceName: state
                                              .excersiceCheckList![index].name!,
                                        )));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Text("Equipment: ${state.excersiceDetailList![index].equipment}"),
                                      const SizedBox(
                                        width: 220,
                                        child: Text(
                                          "Exercise Name: ",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 220,
                                        child: Text(
                                          "${state.excersiceCheckList![index].name}",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      )
                                      // Text("Targets part of body: ${state.excersiceDetailList![index].target}"),
                                    ],
                                  ),
                                  CustomCounter(
                                      exerciseName: state
                                          .excersiceCheckList![index].name!),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SelectExercise()));
          // Add your onPressed logic here
        },
        height: 50.0,
        minWidth: double.infinity,
        color: Colors.orange,
        textColor: Colors.white,
        child: const Text(
          'Start Exercise',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
