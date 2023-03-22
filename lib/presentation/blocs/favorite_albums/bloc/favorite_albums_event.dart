part of 'favorite_albums_bloc.dart';

abstract class FavoriteAlbumsEvent extends Equatable {
  const FavoriteAlbumsEvent();

  @override
  List<Object> get props => [];
}

class FavoriteAlbumsGetEvent extends FavoriteAlbumsEvent {}

class FavoriteAlbumsAddEvent extends FavoriteAlbumsEvent {
  FavoriteAlbumsAddEvent(this.album);
  Album album;
}

class FavoriteAlbumsDeleteEvent extends FavoriteAlbumsEvent {
  FavoriteAlbumsDeleteEvent(this.album);
  Album album;
}
