


class ExerciseModel{
  final String? equipment;
  final String? gifUrl;
  final String? id;
  final String? name;
  final String? target;

  ExerciseModel({this.equipment, this.gifUrl, this.id, this.name, this.target});

    factory ExerciseModel.fromJson(Map<String, dynamic> json) {
      return ExerciseModel(
        equipment: json['equipment'],
        gifUrl: json['gifUrl'],
        id: json['id'],
        name: json['name'],
        target: json['target'],
      );
  }

  // Convert ExerciseModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'equipment': equipment,
      'gifUrl': gifUrl,
      'id': id,
      'name': name,
      'target': target,
    };
  }

}