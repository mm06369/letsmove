

class ExerciseState{

  final bool? isLoading;
  final List<String>? exerciseName;

  ExerciseState({this.isLoading, this.exerciseName});

  ExerciseState copyWith({
    bool? isLoading, 
    List<String>? exerciseName
    
  }){
    return ExerciseState(
      isLoading: isLoading  ?? this.isLoading,
      exerciseName: exerciseName ?? this.exerciseName
      );
  }

}