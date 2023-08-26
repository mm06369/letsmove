class UserModel {
  final String? name;
  final int? age;
  final double? height;
  final double? weight;
  String? level;

  UserModel({this.name, this.age, this.height, this.weight, this.level});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String?,
      age: json['age'] as int?,
      height: json['height'] as double?,
      weight: json['weight'] as double?,
      level: json['level'] as String?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'level' : level
    };
  }
}
