import 'package:video_player/video_player.dart';

class DetailState {
  VideoPlayerController? controller;
  Future<void>? initializeVideoPlayerFuture;
  DetailState({this.controller, this.initializeVideoPlayerFuture});

  DetailState copyWith(
      {VideoPlayerController? controller,
      Future<void>? initializeVideoPlayerFuture}) {
    return DetailState(
        controller: controller ?? this.controller,
        initializeVideoPlayerFuture:
            initializeVideoPlayerFuture ?? this.initializeVideoPlayerFuture);
  }
}
