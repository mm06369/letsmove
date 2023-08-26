import 'package:fitness_app_ui/data/model/user_model.dart';

class UserState {
  UserModel? user;
  bool? isLoading;

  UserState({this.user, this.isLoading});

  UserState copyWith({UserModel? user, bool? isLoading}) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading
    );
  }
}
