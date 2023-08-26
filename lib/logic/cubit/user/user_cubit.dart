import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/data/model/user_model.dart';
import 'package:fitness_app_ui/logic/cubit/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  void getUser() {
    emit(state.copyWith(isLoading: true));
    var response = {
      'name': 'Muhammad',
      'age': 22,
      'height': 6.2,
      'weight': 65.0,
      'level': null
    };
    UserModel user = UserModel.fromJson(response);
    emit(state.copyWith(isLoading: false, user: user));
  }

  void getUserlevel(String level) {
    print("getUserLevel called");
    UserModel tempUser = state.user!;
    tempUser.level = level;
    emit(state.copyWith(user: tempUser));
    print("Current Level: ${state.user!.level}");
  }

  int getNumberExercise() {
    if (state.user?.level == 'Beginner') {
      return 5;
    } else if (state.user?.level == 'Amateur') {
      return 10;
    } else if (state.user?.level == 'Expert') {
      return 20;
    }
    return 0;
  }
}
