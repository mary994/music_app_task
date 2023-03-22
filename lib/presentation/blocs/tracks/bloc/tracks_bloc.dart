import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/core/state/state_types.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/usecases/albums/get_album_track.dart';

part 'tracks_event.dart';
part 'tracks_state.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  GetAlbumTracks getAlbumTracks;
  TracksBloc(this.getAlbumTracks) : super(TracksInitial()) {
    on<TracksEvent>((event, emit) async {
      if (event is GetTracksAlbumEvent) {
        await _getTracksAlbumEvent(event);
      }
    });
  }
  Future<void> _getTracksAlbumEvent(GetTracksAlbumEvent event) async {
    emit(TracksSuccessState(event.album));
    await getAlbumTracks.call(params: event.album);
    emit(TracksSuccessState(event.album));
  }

  void getTracks(Album album) {
    add(GetTracksAlbumEvent(album));
  }
}
