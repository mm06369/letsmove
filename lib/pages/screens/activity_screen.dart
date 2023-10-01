import 'package:fitness_app_ui/logic/cubit/muscle_wiki/activity/activity_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/activity/activity_state.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_excercise_state.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';
import 'package:fitness_app_ui/models/exercise_model.dart';
import 'package:fitness_app_ui/pages/screens/detail_page.dart';
import 'package:fitness_app_ui/pages/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../globals.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({Key? key}) : super(key: key);

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final List<String> menuOptions = [
    'Delete training',
    'Select activities',
    'Reorder activities',
    'Training setting'
  ];
  @override
  Widget build(BuildContext context) {
    print(DateTime.now().weekday.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        actions: [
          PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert), // Icon for the button
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rectangle
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circle
                  ),
                  0.5),
              onSelected: (String result) {},
              itemBuilder: (BuildContext context) => List.generate(
                  menuOptions.length,
                  (index) => PopupMenuItem(
                      value: menuOptions[index],
                      child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            menuOptions[index],
                            style: const TextStyle(fontSize: 12),
                          ))))),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            'Today',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 22, left: 20),
                alignment: Alignment.centerLeft,
                color: Colors.orange,
                width: Globals.getDeviceWidth(context),
                height: Globals.getDeviceHeight(context) * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${days[(DateTime.now().weekday.toInt()) - 1]} activities",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                            Text(
                              '6 minutes',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.whatshot,
                              color: Colors.white,
                            ),
                            Text(
                              '37 kcal',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: Globals.getDeviceHeight(context) * 0.130,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
              ),
              Positioned(
                top: Globals.getDeviceHeight(context) * 0.09,
                left: 310,
                child: BlocBuilder<ActivityCubit, ActivityState>(
                  builder: (context, state) {
                    return FloatingActionButton(
                      backgroundColor: Colors.orange,
                      onPressed: () {
                        if (state.activities!.isEmpty) {
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.info(
                              message: 'You have no exercise to play',
                            ),
                          );
                        }
                      },
                      child: const Icon(
                        Icons.play_arrow,
                        size: 40,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: ElevatedButton(
              onPressed: () {
                // Add your button click logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.white,
                elevation: 0,
                shape: OutlinedBorder.lerp(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Rectangle
                    ),
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circle
                    ),
                    0.5),
                side: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.orange, // Icon color
                  ),
                  SizedBox(width: 8.0), // Add spacing between icon and text
                  Text(
                    'Track heart rate',
                    style: TextStyle(
                      color: Colors.orange, // Text color
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<ActivityCubit, ActivityState>(
            builder: (context, state) {
              return SizedBox(
                  height: 350,
                  child: (state.activities!.isNotEmpty)
                      ? ListView.separated(
                          itemCount: state.activities!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailPage(
                                            exercise: ExerciseModel(
                                                url: state
                                                    .activities![index].url,
                                                exerciseName: state
                                                    .activities![index].name,
                                                bodyPart: state
                                                    .activities![index]
                                                    .bodyPart,
                                                equipment: state
                                                    .activities![index]
                                                    .equipment))));
                              },
                              child: ListTile(
                                // contentPadding: const EdgeInsets.symmetric(
                                //     horizontal: 12, vertical: 5),
                                title: Text(
                                  state.activities![index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 14),
                                ),
                                trailing: Container(
                                  width: 144,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RawMaterialButton(
                                        onPressed: () {
                                          BlocProvider.of<ActivityCubit>(
                                                  context)
                                              .incrementSet(index);
                                        },
                                        elevation: 2.0,
                                        fillColor: Colors.orange,
                                        shape: const CircleBorder(),
                                        constraints:
                                            const BoxConstraints.tightFor(
                                          width: 20, // Adjust the button width
                                          height:
                                              20, // Adjust the button height
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 10, // Adjust the size as needed
                                        ),
                                      ),
                                      RawMaterialButton(
                                        onPressed: () {
                                          BlocProvider.of<ActivityCubit>(
                                                  context)
                                              .decrementSet(index);
                                        },
                                        elevation: 2.0,
                                        fillColor: Colors.orange,
                                        shape: const CircleBorder(),
                                        constraints:
                                            const BoxConstraints.tightFor(
                                          width: 20, // Adjust the button width
                                          height:
                                              20, // Adjust the button height
                                        ),
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 10, // Adjust the size as needed
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            BlocProvider.of<ActivityCubit>(
                                                    context)
                                                .removeFromActivites(index);
                                          },
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                                // trailing: IconButton(
                                //     onPressed: () {
                                //       BlocProvider.of<ActivityCubit>(context)
                                //           .removeFromActivites(index);
                                //     },
                                //     icon: const Icon(Icons.delete)),
                                subtitle: Row(
                                  children: [
                                    Text(
                                        "${state.activities![index].numSets.toString()} Set",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.fiber_manual_record,
                                      color: Colors.orange,
                                      size: 14, // Dot color
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      state.activities![index].equipment!,
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/exercise_illustration.jpg',
                                width: 300,
                                height: 300,
                              ),
                              const Text(
                                "No Exercises selected till yet!",
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SearchPage()));
              // Add your button click logic here
            },
            icon: const Icon(
              Icons.add, // Add icon
              color: Colors.orange, // Icon color (orange)
            ),
            label: const Text(
              'Add Activity',
              style: TextStyle(
                color: Colors.orange, // Text color (orange)
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 80, right: 80),
          child: SizedBox(
            width: 200.0,
            height: 60.0,
            child: BlocBuilder<ActivityCubit, ActivityState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (state.activities!.isEmpty) {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.info(
                          message: 'You have no exercise to finish',
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showAlertDialog(context); // Pass the context.
                        },
                      );
                    }
                    // Add your onPressed logic here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove default padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: const BorderSide(color: Colors.orange, width: 2.0),
                    ),
                    primary: Colors.white, // Set the background color to white
                  ),
                  child: SizedBox(
                    width: 200.0,
                    height: 100.0, // Adjust the height as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Finish Training',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        BlocBuilder<ActivityCubit, ActivityState>(
                          builder: (context, state) {
                            return Text(
                              '0 / ${state.activities!.length} Activities Done',
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 12.0,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}

showAlertDialog(BuildContext context) {
  return BlocBuilder<ActivityCubit, ActivityState>(
    builder: (context, state) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        title: const Text(
          "Finish Training",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.orange,
              fontWeight: FontWeight.w600),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Do you want to finish the training?',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text('You still have ${state.activities!.length} activties left.',
                style: const TextStyle(fontFamily: 'Poppins', fontSize: 14)),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.orange,
                  fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog.
            },
          ),
          TextButton(
            child: const Text('Finish',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.red,
                    fontWeight: FontWeight.w600)),
            onPressed: () {
              // Implement the delete action here.
              // You can add your logic to delete the training.
              Navigator.of(context).pop(); // Close the dialog.
            },
          ),
        ],
      );
    },
  );
}
