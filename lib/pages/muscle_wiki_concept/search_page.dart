import 'dart:math';

import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_excercise_state.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../globals.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey), // Add the border here
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Search Exercises',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Globals.getDeviceWidth(context) * 0.47,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press
                      showBottomSheetOne(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.orange,
                      side: const BorderSide(color: Colors.orange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<SelectExerciseCubit, SelectExerciseState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                Text(
                                  state.equipmentSelected!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Globals.getDeviceWidth(context) * 0.47,
                  child: ElevatedButton(
                    onPressed: () {
                      showBottomSheetTwo(context);
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.grey,
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<SelectExerciseCubit, SelectExerciseState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  state.bodyPartSelected!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SelectExerciseCubit, SelectExerciseState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.exercisesDetail!.length,
                    itemBuilder: (context, index) {
                      if (index != 0)
                        return CustomCard(
                          name: state.exercisesDetail![index].exerciseName!,
                          videoURL: state.exercisesDetail![index].url!,
                        );
                      return Container();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

showBottomSheetOne(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      BlocProvider.of<SelectExerciseCubit>(context).getBodyPartsAndEquipments();
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Category',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: Globals.getDeviceHeight(context) * 0.4,
              child: BlocBuilder<SelectExerciseCubit, SelectExerciseState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.equipments?.length,
                    itemBuilder: (context, index) {
                      final category = state.equipments![index];
                      return ListTile(
                        onTap: () {
                          BlocProvider.of<SelectExerciseCubit>(context)
                              .updateSelectedExercise(state.equipments![index],
                                  state.bodyPartSelected!);
                        },
                        title: Text(category),
                        trailing:
                            state.equipmentSelected == state.equipments![index]
                                ? const Icon(Icons.check)
                                : const SizedBox(),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Reset button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.orange,
                      side: const BorderSide(color: Colors.orange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the modal sheet
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.orange,
                      side: const BorderSide(color: Colors.orange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'Dismiss',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

showBottomSheetTwo(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      BlocProvider.of<SelectExerciseCubit>(context).getBodyPartsAndEquipments();
      // BlocProvider.of<SelectExerciseCubit>(context).getMuscles();
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Select Muscle Group',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<SelectExerciseCubit, SelectExerciseState>(
                builder: (context, state) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.bodyParts?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(state.bodyParts![index]),
                            trailing: state.bodyPartSelected ==
                                    state.bodyParts![index]
                                ? const Icon(Icons.check)
                                : const SizedBox(),
                            onTap: () {
                              BlocProvider.of<SelectExerciseCubit>(context)
                                  .updateSelectedExercise(
                                      state.equipmentSelected!,
                                      state.bodyParts![index]);
                            },
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pop(context) // Close the bottom sheet
                ,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.orange,
                  side: const BorderSide(color: Colors.orange),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Dismiss',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
