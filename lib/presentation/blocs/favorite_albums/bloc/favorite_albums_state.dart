part of 'favorite_albums_bloc.dart';

abstract class FavoriteAlbumsState {
  const FavoriteAlbumsState();
}

class FavoriteAlbumsInitial extends FavoriteAlbumsState implements Loadable {}

///
class FavoriteAlbumsSuccessState extends FavoriteAlbumsState {
  FavoriteAlbumsSuccessState(this.albums,
      {this.deleteFailed, this.saveFailed, this.album});
  final List<Album> albums;
  bool? saveFailed;
  bool? deleteFailed;
  Album? album;
  FavoriteAlbumsSuccessState copyWith(
      {bool? saveFailed, bool? deleteFailed, Album? album}) {
    return FavoriteAlbumsSuccessState(albums,
        album: album ?? this.album,
        saveFailed: saveFailed ?? this.saveFailed,
        deleteFailed: deleteFailed ?? this.deleteFailed);
  }
}
