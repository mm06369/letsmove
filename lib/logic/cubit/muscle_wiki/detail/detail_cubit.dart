import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';

import 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailState());

  addURL(String url) {
    state.controller = VideoPlayerController.networkUrl(
      Uri.parse(
        url,
      ),
    );

    emit(state.copyWith(controller: state.controller));
    emit(state.copyWith(
        initializeVideoPlayerFuture: state.controller?.initialize()));
    state.controller?.setLooping(true);
    state.controller?.play();
    emit(state.copyWith(controller: state.controller));
  }
}
