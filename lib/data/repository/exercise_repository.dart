


import 'package:fitness_app_ui/data/provider/exercise_provider.dart';

class ExerciseRepository{

  final provider = ExerciseProvider();

  Future<List<String>> getExerciseName() async {
    final result = await provider.getExerciseName();
    if (result[0] == "Error"){
      return ["Error"];
    }
    List<String> exerciseNames = [];
    for (var exercise in result){
      exerciseNames.add(exercise);
    }
    return exerciseNames;
  }
}

// void main(){
//   var a = ExerciseRepository();
//   a.getExerciseName();
// }