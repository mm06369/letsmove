import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/exercise_detail/exercise_detail_cubit.dart';

class CustomCounter extends StatefulWidget {
  final String exerciseName;
  int? initialValue;

  CustomCounter({required this.exerciseName, this.initialValue});

  @override
  _CustomCounterState createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  // void updateExerciseLaps(String exerciseName) {
  //   BlocProvider.of<ExerciseDetailCubit>(context)
  //       .updateExcersiceLapList(exerciseName);
  // }

  late final String exerciseName;
  int? initialValue;
  int _currentNumber = 0;

  @override
  void initState() {
    exerciseName = widget.exerciseName;
    initialValue = widget.initialValue;
    _currentNumber = initialValue ?? 0;

    super.initState();
  }

  void _incrementNumber() {
    setState(() {
      _currentNumber++;
    });
  }

  void _decrementNumber() {
    setState(() {
      _currentNumber--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: _decrementNumber,
          ),
          // SizedBox(width: 5.0),
          Text(
            _currentNumber.toString(),
            style: const TextStyle(fontSize: 14.0),
          ),
          // SizedBox(width: 5.0),
          IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: () {
              _incrementNumber();
              // updateExerciseLaps(exerciseName);
            },
          ),
        ],
      ),
    );
  }
}
