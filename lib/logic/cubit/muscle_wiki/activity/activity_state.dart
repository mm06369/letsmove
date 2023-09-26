


import '../../../../models/activity_model.dart';

class ActivityState {
  List<Activity>? activities;

  ActivityState({
    this.activities,
  });

  ActivityState copyWith({
    List<Activity>? activities,
  }) {
    return ActivityState(
      activities: activities ?? this.activities,
    );
  }
}
