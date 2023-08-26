import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/logic/cubit/display_exercise/display_exercise_state.dart';

class DisplayExerciseCubit extends Cubit<DisplayExerciseState> {
  DisplayExerciseCubit() : super(DisplayExerciseState(isImageLoaded: false));

  updateImageStatus() {
    print("updateImageStatus called");
    emit(state.copyWith(isImageLoaded: true));
  }

  bool getStatus() {
    return state.isImageLoaded!;
  }
}
