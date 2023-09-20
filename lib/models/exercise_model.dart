class ExerciseModel {
  final int? exerciseId;
  final String? exerciseName;
  final String? bodyPart;
  final String? equipment;
  final String? gender;
  final String? target;
  final String? url;

  ExerciseModel({
    this.exerciseId,
    this.exerciseName,
    this.bodyPart,
    this.equipment,
    this.gender,
    this.target,
    this.url
  });

  // Create a factory constructor to deserialize from JSON
  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      exerciseId: json['exerciseId'],
      exerciseName: json['exerciseName'],
      bodyPart: json['bodyPart'],
      equipment: json['equipment'],
      gender: json['gender'],
      target: json['target'],
      url: json['videoURL']
    );
  }

  // Create a method to serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'exerciseId': exerciseId,
      'exerciseName': exerciseName,
      'bodyPart': bodyPart,
      'equipment': equipment,
      'gender': gender,
      'target': target,
    };
  }
}
