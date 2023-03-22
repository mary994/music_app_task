// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasources/local/app_database.dart' as _i3;
import 'data/datasources/remote/music_service.dart' as _i5;
import 'data/repositories/albums/albums_repository.dart' as _i7;
import 'data/repositories/artist/artist_repository.dart' as _i9;
import 'di/api_module.dart' as _i17;
import 'domin/repositories/albums_repository.dart' as _i6;
import 'domin/repositories/artist_repository.dart' as _i8;
import 'domin/usecases/albums/get_album_track.dart' as _i11;
import 'domin/usecases/artists/get_top_albums.dart' as _i13;
import 'domin/usecases/artists/search_for_artist.dart' as _i14;
import 'domin/usecases/favorite_albums/add_album_to_favorite_list.dart' as _i15;
import 'domin/usecases/favorite_albums/delete_album_from_favorite_list.dart'
    as _i10;
import 'domin/usecases/favorite_albums/get_favorite_albums.dart' as _i12;
import 'presentation/blocs/favorite_albums/bloc/favorite_albums_bloc.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.singleton<_i3.AppDataBase>(_i3.AppDataBase());
  gh.factory<_i4.Dio>(() => apiModule.getDioClient());
  gh.lazySingleton<_i5.MusicService>(() => _i5.MusicService(get<_i4.Dio>()));
  gh.lazySingleton<_i6.AlbumsRepository>(() => _i7.AlbumsRepositoryImpl(
      get<_i3.AppDataBase>(), get<_i5.MusicService>()));
  gh.lazySingleton<_i8.ArtistRepository>(() => _i9.ArtistRepositoryImpl(
      get<_i5.MusicService>(), get<_i3.AppDataBase>()));
  gh.lazySingleton<_i10.DeleteAlbumFromFavoriteList>(
      () => _i10.DeleteAlbumFromFavoriteList(get<_i6.AlbumsRepository>()));
  gh.lazySingleton<_i11.GetAlbumTracks>(
      () => _i11.GetAlbumTracks(get<_i6.AlbumsRepository>()));
  gh.lazySingleton<_i12.GetFavoriteAlbums>(
      () => _i12.GetFavoriteAlbums(get<_i6.AlbumsRepository>()));
  gh.lazySingleton<_i13.GetTopAlbums>(
      () => _i13.GetTopAlbums(get<_i8.ArtistRepository>()));
  gh.lazySingleton<_i14.SearchForArtist>(
      () => _i14.SearchForArtist(get<_i8.ArtistRepository>()));
  gh.lazySingleton<_i15.AddAlbumFromFavoriteList>(
      () => _i15.AddAlbumFromFavoriteList(get<_i6.AlbumsRepository>()));
  gh.lazySingleton<_i16.FavoriteAlbumsBloc>(() => _i16.FavoriteAlbumsBloc(
      get<_i15.AddAlbumFromFavoriteList>(),
      get<_i10.DeleteAlbumFromFavoriteList>(),
      get<_i12.GetFavoriteAlbums>()));
  return get;
}

class _$ApiModule extends _i17.ApiModule {}
