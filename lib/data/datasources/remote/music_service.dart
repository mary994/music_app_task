import 'package:injectable/injectable.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/data/model/album/get_album_tracks_response.dart';
import 'package:music_app/data/model/artist/artist_search_response.dart';
import 'package:music_app/data/model/artist/get_top_albums_response.dart';

import 'package:music_app/domin/usecases/artists/search_for_artist.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'music_service.g.dart';

@LazySingleton()
@RestApi(
  baseUrl: AppConst.kApiEndPoint,
)
abstract class MusicService {
  @factoryMethod
  factory MusicService(Dio dio) = _MusicService;

  @GET('')
  Future<HttpResponse<ArtistSearchResponse>> searchForArtist(
      @Query('artist') String artist,
      {@Query('api_key') String apiKey = AppConst.kApiKey,
      @Query('format') String format = 'json',
      @Query('method') String method = 'artist.search'});

  @GET('')
  Future<HttpResponse<GetTopAlbumsResponse>> getTopAlbums(
      @Query('mbid') String mbid,
      {@Query('api_key') String apiKey = AppConst.kApiKey,
      @Query('format') String format = 'json',
      @Query('method') String method = 'artist.gettopalbums'});
  @GET('')
  Future<HttpResponse<GetAlbumTracksResponse>> getAlbumTracks(
      @Query('mbid') String mbid, @Query('artist') String artist,
      {@Query('api_key') String apiKey = AppConst.kApiKey,
      @Query('format') String format = 'json',
      @Query('method') String method = 'album.getinfo'});
}
