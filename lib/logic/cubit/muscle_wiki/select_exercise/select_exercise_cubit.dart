import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_excercise_state.dart';
import 'package:fitness_app_ui/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../database_helper.dart';

class SelectExerciseCubit extends Cubit<SelectExerciseState> {
  SelectExerciseCubit()
      : super(SelectExerciseState(equipmentSelected: "Body weight", bodyPartSelected: 'Any', equipments: [], bodyParts: [], exercisesDetail: [])){
        getExercises('Body weight', 'Any');
      }

  updateSelectedExercise(String equipment, String bodyPart) {
    debugPrint("UpdateSelectedExercise called: $equipment,  $bodyPart");
    getExercises(equipment, bodyPart);
    emit(state.copyWith(equipmentSelected: equipment, bodyPartSelected: bodyPart));
  }
  
  updateExerciseWithBodyPart(String excersice, ){

  }

  getBodyPartsAndEquipments() async {

    // final cat = ['Abdominals', 'Biceps', 'Calves', 'Chest', 'Forearms'];

    var db = await DatabaseHelper.instance.database;
    var data = await db.rawQuery("SELECT DISTINCT equipment, bodyPart from excersieTable");
    List<String> equipmentNames = data.map((map) => map['equipment'] as String).toList();
    equipmentNames.removeAt(0);
    equipmentNames.insert(0, 'Any');
    equipmentNames.insert(0, 'Featured');
    equipmentNames = equipmentNames.toSet().toList();
    List<String> muscles = data.map((map) => map['bodyPart'] as String).toList();
    muscles.removeAt(0);
    muscles.insert(0, 'Any');
    muscles = muscles.toSet().toList();
    // print("Equipment Names: $equipmentNames");
    // print("bodyPart List: $muscles");
    emit(state.copyWith(equipments: equipmentNames, bodyParts: muscles));
  
  }

  getExercises(String equipment, String bodyPart) async {
    debugPrint("Get Exercises called");
    var db = await DatabaseHelper.instance.database;
    
    var data;
    if (bodyPart == 'Any'){
      debugPrint("Body part Any query called");
      data = await db.rawQuery("SELECT * from excersieTable where equipment = '$equipment'");
    }
    else if (equipment == 'Any'){
      debugPrint("Equipment Any query called");
      data = await db.rawQuery("SELECT * from excersieTable where bodyPart = '$bodyPart'");
    }
    else{
      debugPrint("Body part and equipment query called");
      data = await db.rawQuery("SELECT * from excersieTable where bodyPart = '$bodyPart' and equipment = '$equipment'");

    }
    
    List<ExerciseModel> exercisesDetail = [];
    for (var exercise in data){
      exercisesDetail.add(ExerciseModel.fromJson(exercise));
    }
    // print(exercisesDetail);
    emit(state.copyWith(exercisesDetail: exercisesDetail));
  }


}
