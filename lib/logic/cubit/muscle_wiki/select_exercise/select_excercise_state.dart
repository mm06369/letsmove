import 'package:flutter/material.dart';

class SelectExerciseState {
  final String? exerciseSelected;
  final List<String>? exercises;
  final List<IconData>? icons;
  final List<String>? muscles;

  SelectExerciseState({this.exerciseSelected, this.exercises, this.icons, this.muscles});

  SelectExerciseState copyWith(
      {String? exerciseSelected,
      List<String>? exercises,
      List<IconData>? icons,
      List<String>? muscles
      }) {
    return SelectExerciseState(
        exerciseSelected: exerciseSelected ?? this.exerciseSelected,
        exercises: exercises ?? this.exercises,
        icons: icons ?? this.icons,
        muscles: muscles ?? this.muscles
        );
  }
}
