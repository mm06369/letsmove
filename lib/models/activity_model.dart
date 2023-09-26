class Activity {
  String? name;
  String? equipment;
  String? bodyPart;
  String? url;
  int? numSets;

  // Constructor
  Activity({
    this.name,
    this.equipment,
    this.bodyPart,
    this.numSets,
    this.url
  });

  // Factory constructor to create an Activity object from JSON
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      name: json['name'] as String?,
      equipment: json['equipment'] as String?,
      bodyPart: json['bodyPart'] as String?,
      numSets: json['numSets'] as int?,
    );
  }

  // Convert an Activity object to a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['equipment'] = equipment;
    data['bodyPart'] = bodyPart;
    data['numSets'] = numSets;
    return data;
  }
}
