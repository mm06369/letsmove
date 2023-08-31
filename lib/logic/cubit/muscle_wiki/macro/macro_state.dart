class MacroState {
  final int? pageIndex;
  final String? boxSelected;
  MacroState({this.pageIndex, this.boxSelected});

  MacroState copyWith({int? pageIndex, String? boxSelected}) {
    return MacroState(pageIndex: pageIndex ?? this.pageIndex, boxSelected: boxSelected ?? this.boxSelected);
  }
}
