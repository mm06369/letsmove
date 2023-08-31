class CalorieState {
  final int? age;
  final String? weightUnit;
  final int? pageIndex;

  CalorieState({this.age, this.weightUnit, this.pageIndex});

  CalorieState copyWith({int? age, String? weightUnit, int? pageIndex}) {
    return CalorieState(
        age: age ?? this.age, weightUnit: weightUnit ?? this.weightUnit, pageIndex: pageIndex ?? this.pageIndex);
  }
}
