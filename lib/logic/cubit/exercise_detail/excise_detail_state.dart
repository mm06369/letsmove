import 'package:fitness_app_ui/data/model/exercise_laps.dart';

import '../../../data/model/exercise_model.dart';

class ExerciseDetailState {
  final List<ExerciseModel>? excersiceDetailList;
  final List<ExerciseModel>? excersiceCheckList;
  final bool? isLoading;

  ExerciseDetailState(
      {this.excersiceDetailList, this.isLoading, this.excersiceCheckList});

  ExerciseDetailState copyWith(
      {List<ExerciseModel>? excersiceDetailList,
      bool? isLoading,
      List<ExerciseModel>? excersiceCheckList}) {
    return ExerciseDetailState(
        excersiceDetailList: excersiceDetailList ?? this.excersiceDetailList,
        isLoading: isLoading ?? this.isLoading,
        excersiceCheckList: excersiceCheckList ?? this.excersiceCheckList);
  }
}
