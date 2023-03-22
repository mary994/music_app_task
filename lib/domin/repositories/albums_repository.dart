import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/domin/entities/album.dart';

abstract class AlbumsRepository {
  Future<Resource> getAlbumTracks(Album album);

  Future<Resource> getFavoritesAlbums();

  Future<Resource> saveAlbum(Album album);
  Future<Resource> deleteAlbum(Album album);
  // Future<Resource> isFavorite(Album album);
}
