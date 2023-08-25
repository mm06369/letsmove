


import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/data/repository/exercise_repository.dart';

import 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState>{

  ExerciseCubit():super(ExerciseState(isLoading: false, exerciseName: []));

  final repository = ExerciseRepository();

  getExerciseNames() async {

    print("Function is cubit called");

    emit(state.copyWith(isLoading: true));
    final result = await repository.getExerciseName();
    print("Cubit: $result");
    if (result[0] == "Error"){
      emit(state.copyWith(isLoading: false));
    }
    emit(state.copyWith(exerciseName: result, isLoading: false));

  }

}