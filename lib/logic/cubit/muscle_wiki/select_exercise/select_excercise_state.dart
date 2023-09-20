import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../models/exercise_model.dart';

class SelectExerciseState {
  final String? equipmentSelected;
  final String? bodyPartSelected;
  final List<String>? equipments;
  final List<IconData>? icons;
  final List<String>? bodyParts;
  List<ExerciseModel>? exercisesDetail;
  VideoPlayerController? controller;
  Future<void>? initializeVideoPlayerFuture;

  SelectExerciseState({this.equipmentSelected, this.equipments, this.icons, this.bodyParts, this.exercisesDetail, this.controller, this.initializeVideoPlayerFuture, this.bodyPartSelected});

  SelectExerciseState copyWith(
      {String? equipmentSelected,
      List<String>? equipments,
      List<IconData>? icons,
      List<String>? bodyParts,
      List<ExerciseModel>? exercisesDetail,
        VideoPlayerController? controller,
      String? bodyPartSelected
      }) {
    return SelectExerciseState(
        equipmentSelected: equipmentSelected ?? this.equipmentSelected,
        equipments: equipments ?? this.equipments,
        icons: icons ?? this.icons,
        bodyParts: bodyParts ?? this.bodyParts,
        exercisesDetail: exercisesDetail ?? this.exercisesDetail,
        controller: controller ?? this.controller,
        initializeVideoPlayerFuture: initializeVideoPlayerFuture ?? this.initializeVideoPlayerFuture,
        bodyPartSelected: bodyPartSelected ?? this.bodyPartSelected
        );
  }
}
