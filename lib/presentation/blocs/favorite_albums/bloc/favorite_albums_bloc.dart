import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/core/state/state_types.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/usecases/favorite_albums/add_album_to_favorite_list.dart';
import 'package:music_app/domin/usecases/favorite_albums/delete_album_from_favorite_list.dart';
import 'package:music_app/domin/usecases/favorite_albums/get_favorite_albums.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:music_app/generated/app_text.dart';

part 'favorite_albums_event.dart';
part 'favorite_albums_state.dart';

@LazySingleton()
class FavoriteAlbumsBloc
    extends Bloc<FavoriteAlbumsEvent, FavoriteAlbumsState> {
  AddAlbumFromFavoriteList addAlbumFromFavoriteList;
  DeleteAlbumFromFavoriteList deleteAlbumFromFavoriteList;
  GetFavoriteAlbums getFavoriteAlbums;

  FavoriteAlbumsBloc(this.addAlbumFromFavoriteList,
      this.deleteAlbumFromFavoriteList, this.getFavoriteAlbums)
      : super(FavoriteAlbumsInitial()) {
    on<FavoriteAlbumsEvent>((event, emit) async {
      if (event is FavoriteAlbumsGetEvent) {
        await _favoriteAlbumsGetEvent();
      } else if (event is FavoriteAlbumsAddEvent) {
        await _favoriteAlbumsAddEvent(event);
      } else if (event is FavoriteAlbumsDeleteEvent) {
        await _favoriteAlbumsDeleteEvent(event);
      }
    });
  }
  Future<void> _favoriteAlbumsAddEvent(FavoriteAlbumsAddEvent event) async {
    Resource resource =
        await addAlbumFromFavoriteList.call(params: event.album);
    if (resource is FailedResource) {
      event.album.isFavorite = false;
      if (state is FavoriteAlbumsSuccessState) {
        emit((state as FavoriteAlbumsSuccessState)
            .copyWith(saveFailed: true, album: event.album));
      }
    } else {
      await _favoriteAlbumsGetEvent();
    }
  }

  Future<void> _favoriteAlbumsDeleteEvent(
      FavoriteAlbumsDeleteEvent event) async {
    Resource resource =
        await deleteAlbumFromFavoriteList.call(params: event.album);
    await _favoriteAlbumsGetEvent();
  }

  Future<void> _favoriteAlbumsGetEvent() async {
    Resource resource = await getFavoriteAlbums.call();
    if (resource is SuccessResource) {
      emit(FavoriteAlbumsSuccessState(resource.data));
    } else {
      emit(FavoriteAlbumsSuccessState([]));
    }
  }

  void addAlbum(Album album) {
    album.isFavorite = true;
    add(FavoriteAlbumsAddEvent(album));
  }

  void deleteAlbum(Album album) {
    album.isFavorite = false;
    add(FavoriteAlbumsDeleteEvent(album));
  }

  void getAllFavAlbums() {
    add(FavoriteAlbumsGetEvent());
  }
}
