import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_excercise_state.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';
import 'package:fitness_app_ui/pages/components/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../globals.dart';

class SearchPage extends StatelessWidget {

  String? bodyPart;

  SearchPage({Key? key, this.bodyPart = "Body weight"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){
          Navigator.of(context).pop();
        },),
      ),
      body: SafeArea(
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
              // ElevatedButton(onPressed: (){
              //   Navigator.of(context).pop();
              // }, child: Text("Back")),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Equipment: ",
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: Globals.getDeviceWidth(context) * 0.47,
                        child: ElevatedButton(
                          onPressed: () {
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
                              BlocBuilder<SelectExerciseCubit,
                                  SelectExerciseState>(
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: 135,
                                        child: Text(
                                          state.equipmentSelected!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Body Part: ",
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: Globals.getDeviceWidth(context) * 0.47,
                        child: ElevatedButton(
                          onPressed: () {
                            showBottomSheetTwo(context);
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
                              BlocBuilder<SelectExerciseCubit,
                                  SelectExerciseState>(
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        width: 131,
                                        child: Text(
                                          state.bodyPartSelected!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<SelectExerciseCubit, SelectExerciseState>(
                builder: (context, state) {
                  return Expanded(
                    child: (state.exercisesDetail!.isNotEmpty) ? ListView.separated(
                      key: UniqueKey(),
                      itemCount: state.exercisesDetail!.length,
                      itemBuilder: (context, index) {
                        if (index != 0){
                          return CustomCard(
                            exercise: state.exercisesDetail![index],
                            // name: state.exercisesDetail![index].exerciseName!,
                            // videoURL: state.exercisesDetail![index].url!,
                          );
                        }
                        return Container();
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ): const Center(child: Text("Oops, Look like no exercise exists for this selection!")),
                  );
                },
              )
            ],
          ),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Category',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
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
                      return Column(
                        children: [
                          ListTile(
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
                          ),
                          Container(
                              width: Globals.getDeviceWidth(
                                  context), 
                              height: 2.0, 
                              decoration: BoxDecoration(
                                color: Colors.white, 
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.3), 
                                    spreadRadius: 4, 
                                    blurRadius: 6, 
                                    offset: const Offset(0,2), 
                                  ),
                                ],
                              ),
                            )
                        ],
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
                      BlocProvider.of<SelectExerciseCubit>(context).resetEquipment();
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
                      'Done',
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
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Select Muscle Group',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: Globals.getDeviceHeight(context) * 0.4,
                child: BlocBuilder<SelectExerciseCubit, SelectExerciseState>(
                  builder: (context, state) {
                    return ListView.builder(
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
                            Container(
                              width: Globals.getDeviceWidth(
                                  context), 
                              height: 2.0, 
                              decoration: BoxDecoration(
                                color: Colors.white, 
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.3), 
                                    spreadRadius: 4, 
                                    blurRadius: 6, 
                                    offset: const Offset(0,2), 
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pop(context) ,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.orange,
                  side: const BorderSide(color: Colors.orange),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Done',
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
