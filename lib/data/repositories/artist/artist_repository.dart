import 'package:injectable/injectable.dart';
import 'package:music_app/core/resource/http_response_handler.dart';
import 'package:music_app/data/datasources/local/app_database.dart';
import 'package:music_app/data/datasources/remote/music_service.dart';
import 'package:music_app/data/model/artist/artist_search_response.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/domin/repositories/artist_repository.dart';
import 'package:music_app/domin/usecases/artists/search_for_artist_params.dart';
import 'package:retrofit/dio.dart';
import 'package:music_app/data/model/artist/get_top_albums_response.dart';

@LazySingleton(as: ArtistRepository)
class ArtistRepositoryImpl implements ArtistRepository {
  ArtistRepositoryImpl(this.musicService, this.appDataBase);
  MusicService musicService;
  AppDataBase appDataBase;

  @override
  Future<Resource> searchForArtist(SearchForArtistParams params) async {
    Resource resource = await HttpResponseHandler<ArtistSearchResponse>()
        .handle(musicService.searchForArtist(params.artist));
    if (resource is SuccessResource<ArtistSearchResponse>) {
      return SuccessResource<List<Artist>>(
          resource.data.results?.artistMatches?.artist ?? []);
    } else {
      return resource;
    }
  }

  @override
  Future<Resource> getTopAlbums(Artist artist) async {
    Resource resource = await HttpResponseHandler<GetTopAlbumsResponse>()
        .handle(musicService.getTopAlbums(artist.mbid!));
    if (resource is SuccessResource<GetTopAlbumsResponse>) {
      List<AlbumModel> list = await appDataBase.getFavoritesAlbums();
      resource.data.topAlbums?.album?.forEach((album) {
        album.isFavorite =
            list.where((element) => element.mbid == album.mbid).isNotEmpty;
      });
      return SuccessResource<List<Album>>(resource.data.topAlbums?.album ?? []);
    } else {
      return resource;
    }
  }
}
