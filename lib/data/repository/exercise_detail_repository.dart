

import '../model/exercise_model.dart';
import '../provider/exercise_detail_provider.dart';

class ExerciseDetailRepository{

  final provider = ExerciseDetailProvider();

  Future<List<ExerciseModel>> getExerciseName(String bodyPartName) async {


    final result = await provider.getExerciseDetail(bodyPartName);
    if (result[0] == "Error"){
      return [ExerciseModel(name: "Error")];
    }
    List<ExerciseModel> exerciseNames = [];
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