import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_excercise_state.dart';
import 'package:flutter/material.dart';

import '../../../../database_helper.dart';

class SelectExerciseCubit extends Cubit<SelectExerciseState> {
  SelectExerciseCubit()
      : super(SelectExerciseState(exerciseSelected: "Body weight", exercises: [], muscles: []));

  updateSelectedExercise(String excersice) {
    getExercises(excersice);
    emit(state.copyWith(exerciseSelected: excersice));
  }
  

  getBodyPartsAndEquipments() async {

    // final cat = ['Abdominals', 'Biceps', 'Calves', 'Chest', 'Forearms'];

    final iconsList = [
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

    var db = await DatabaseHelper.instance.database;
    var data = await db.rawQuery("SELECT DISTINCT equipment, bodyPart from excersieTable");
    List<String> equipmentNames = data.map((map) => map['equipment'] as String).toList();
    equipmentNames.removeAt(0);
    equipmentNames.insert(0, 'Featured');
    equipmentNames = equipmentNames.toSet().toList();
    List<String> muscles = data.map((map) => map['bodyPart'] as String).toList();
    muscles.removeAt(0);
    muscles = muscles.toSet().toList();
    emit(state.copyWith(exercises: equipmentNames, muscles: muscles, icons: iconsList));
  
  }

  getExercises(String category) async {
    debugPrint("Get Exercises called");
    var db = await DatabaseHelper.instance.database;
    var data = await db.rawQuery("SELECT * from excersieTable where bodyPart = 'Body Weight'");
    print(data.toList());
  }

}
