import 'dart:async';

import 'package:fitness_app_ui/data/model/exercise_model.dart';
import 'package:fitness_app_ui/logic/cubit/display_exercise/display_exercise_state.dart';
import 'package:fitness_app_ui/logic/cubit/display_exercise/dsiplay_exercise_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/exercise_detail/exercise_detail_cubit.dart';
import 'package:fitness_app_ui/pages/exercises/components/pause_resume_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ShowExcercise extends StatelessWidget {
//   final String gifUrl;
//   final String excersiceName;
//   ShowExcercise({Key? key, required this.gifUrl, required this.excersiceName})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           iconTheme: const IconThemeData(color: Colors.grey)),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Text("Exercise Name: $excersiceName"),
//               const SizedBox(
//                 height: 40,
//               ),
//               Center(
//                 child: Image.network(gifUrl,
//                     loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) {
//                     return child;
//                   } else {
//                     return const Text(
//                         "Showing the illustration in a second, sit tight!");
//                   }
//                 }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ShowExercise extends StatefulWidget {
  @override
  _ShowExerciseState createState() => _ShowExerciseState();
}

class _ShowExerciseState extends State<ShowExercise> {
  int currentGifIndex = 0;
  late Timer timer;
  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    List<ExerciseModel> gifUrls = BlocProvider.of<ExerciseDetailCubit>(context)
        .getListOfCheckedExercises();

    void startTimer() {
      timer = Timer.periodic(const Duration(seconds: 10), (timer) {
        if (!isPaused) {
          setState(() {
            currentGifIndex = (currentGifIndex + 1) % gifUrls.length;
          });
        }
      });
    }

    startTimer();

    void togglePause() {
      setState(() {
        isPaused = !isPaused;
        if (isPaused) {
          timer.cancel(); // Stop the timer when paused
        } else {
          startTimer(); // Resume the timer
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Exercise Illustration',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: gifUrls.isNotEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Exercise Name: ${gifUrls[currentGifIndex].name}'),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.network(
                    gifUrls[currentGifIndex].gifUrl!,
                    width: 200,
                    height: 200,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PauseResumeButton(isPaused: isPaused, onPressed: togglePause)
                ],
              ),
            )
          : const Center(
              child: Text("You haven't selected any exercise"),
            ),
    );
  }
}
