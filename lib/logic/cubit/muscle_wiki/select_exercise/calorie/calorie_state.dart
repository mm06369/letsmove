class CalorieState {
  final int? age;
  final String? weightUnit;

  CalorieState({this.age, this.weightUnit});

  CalorieState copyWith({int? age, String? weightUnit}) {
    return CalorieState(
        age: age ?? this.age, weightUnit: weightUnit ?? this.weightUnit);
  }
}
