import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_excercise_state.dart';
import 'package:flutter/material.dart';

class SelectExerciseCubit extends Cubit<SelectExerciseState> {
  SelectExerciseCubit()
      : super(SelectExerciseState(exerciseSelected: "Featured"));

  updateSelectedExercise(String excersice) {
    emit(state.copyWith(exerciseSelected: excersice));
  }

  getExercises() {
    final categories = [
      'Favorites',
      'Featured',
      'Stretches',
      'Bodyweight',
      'Barbell',
      'Dumbbells',
      'Cables',
      'Kettlebells',
      'Band',
      'TRX',
      'Plate',
      'Yoga',
      'Machine'
    ];

    final IconsList = [
      Icons.favorite,
      Icons.star,
      Icons.accessibility,
      Icons.accessible,
      Icons.anchor,
      Icons.block,
      Icons.cake,
      Icons.child_care,
      Icons.directions_bike,
      Icons.drive_eta,
      Icons.extension,
      Icons.fingerprint,
      Icons.games,
    ];

    emit(state.copyWith(exercises: categories, icons: IconsList));
  }

  getMuscles() {
    final muscle = ['Abdominals', 'Biceps', 'Calves', 'Chest', 'Forearms'];
    emit(state.copyWith(muscles: muscle));
  }
}
