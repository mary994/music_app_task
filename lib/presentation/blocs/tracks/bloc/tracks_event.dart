part of 'tracks_bloc.dart';

abstract class TracksEvent extends Equatable {
  const TracksEvent();

  @override
  List<Object> get props => [];
}

class GetTracksAlbumEvent extends TracksEvent {
  GetTracksAlbumEvent(this.album);
  Album album;
}
