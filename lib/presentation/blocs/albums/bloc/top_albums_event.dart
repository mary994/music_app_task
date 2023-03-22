part of 'top_albums_bloc.dart';

abstract class TopAlbumsEvent {
  const TopAlbumsEvent();
}

class TopAlbumsGetEvent extends TopAlbumsEvent {
  TopAlbumsGetEvent(this.artist, {this.withLoading = true});
  Artist artist;
  bool withLoading;
}
