import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/macro/macro_state.dart';

class MacroCubit extends Cubit<MacroState> {
  MacroCubit() : super(MacroState(pageIndex: 0, boxSelected: 'High Carb'));

  updatePageIndex() {
    emit(state.copyWith(pageIndex: state.pageIndex == 0 ? 1 : 0));
  }

  updateBoxSelected(String value) {
    emit(state.copyWith(boxSelected: value));
  }
}
