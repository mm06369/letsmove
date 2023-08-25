class ExerciseLaps {
  final int? id;
  final String? exerciseName;
  int? numLaps;

  ExerciseLaps({this.id, this.exerciseName, this.numLaps = 0});

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exerciseName': exerciseName,
      'numLaps': numLaps,
    };
  }

  factory ExerciseLaps.fromJson(Map<String, dynamic> json) {
    return ExerciseLaps(
      id: json['id'],
      exerciseName: json['name'],
      numLaps: 0,
    );
  }


}
