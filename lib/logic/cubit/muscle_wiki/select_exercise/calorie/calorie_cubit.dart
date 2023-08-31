import 'package:bloc/bloc.dart';

import 'calorie_state.dart';

class CalorieCubit extends Cubit<CalorieState> {
  CalorieCubit() : super(CalorieState(age: 0, weightUnit: "imperial", pageIndex: 0));

  getAgeAndWeight() {
    emit(state.copyWith(age: 0, weightUnit: 'imperial'));
  }

  updateAge(int age) {
    emit(state.copyWith(age: age));
  }

  updateWeightUnit(String newUnit) {
    emit(state.copyWith(weightUnit: newUnit));
  }

  updatePageIndex() {
    emit(state.copyWith(pageIndex: state.pageIndex == 0 ? 1 : 0));
  }
}
