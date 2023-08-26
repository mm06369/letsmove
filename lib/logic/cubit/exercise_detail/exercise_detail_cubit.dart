import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/data/model/exercise_model.dart';
import 'package:fitness_app_ui/data/repository/exercise_detail_repository.dart';
import 'excise_detail_state.dart';

class ExerciseDetailCubit extends Cubit<ExerciseDetailState> {
  ExerciseDetailCubit()
      : super(ExerciseDetailState(isLoading: false, excersiceCheckList: []));

  final repository = ExerciseDetailRepository();

  getExerciseDetail(String bodyPartName) async {
    emit(state.copyWith(isLoading: true));
    final result = await repository.getExerciseName(bodyPartName);
    if (result[0].name == "Error") {
      emit(state.copyWith(isLoading: false));
    }
    emit(state.copyWith(excersiceDetailList: result, isLoading: false));
  }

  void removeExercises(ExerciseModel exercise) {
    List<ExerciseModel> tempLst = state.excersiceCheckList ?? [];

    tempLst.removeWhere((exercises) => exercise.id == exercises.id);

    emit(state.copyWith(excersiceCheckList: tempLst));
  }

  addExercises(ExerciseModel exercise) {
    List<ExerciseModel> tempLst = state.excersiceCheckList ?? [];
    bool a = true;

    print("add called");
    for (var exercises in tempLst) {
      if (exercise.name == exercises.name) {
        a = false;
      }
    }
    if (a) {
      tempLst.add(exercise);
    }
    emit(state.copyWith(excersiceCheckList: tempLst));
    print(state.excersiceCheckList.toString());
    print(tempLst);
  }

  getExercises() {
    print(state.excersiceCheckList.toString());
  }

  getListOfCheckedExercises() {
    return state.excersiceCheckList;
  }
}
