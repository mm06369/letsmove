


class DisplayExerciseState {
  final bool? isImageLoaded;
  DisplayExerciseState({this.isImageLoaded});

  DisplayExerciseState copyWith({bool? isImageLoaded}) {
    return DisplayExerciseState(
        isImageLoaded: isImageLoaded ?? this.isImageLoaded);
  }
}
