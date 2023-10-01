

import 'package:bloc/bloc.dart';

import '../../../../models/activity_model.dart';
import 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState>{
  
  ActivityCubit():super(ActivityState(activities: []));

  addToActivities(Activity activity){
    state.activities!.add(activity);
    emit(state.copyWith(activities: state.activities));
  }

  removeFromActivites(int index){
    state.activities!.removeAt(index);
    emit(state.copyWith(activities: state.activities));
  }

  incrementSet(int index){
    state.activities![index].numSets = state.activities![index].numSets! + 1;
    emit(state.copyWith(activities: state.activities));
  }

    decrementSet(int index){

    if (state.activities![index].numSets! >  0){
      state.activities![index].numSets = state.activities![index].numSets! - 1;
    };
    emit(state.copyWith(activities: state.activities));
  }

}