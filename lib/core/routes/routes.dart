import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/injection.dart';
import 'package:music_app/presentation/blocs/albums/bloc/top_albums_bloc.dart';
import 'package:music_app/presentation/blocs/artists/bloc/artists_bloc.dart';
import 'package:music_app/presentation/blocs/tracks/bloc/tracks_bloc.dart';
import 'package:music_app/presentation/pages/album_details_page.dart';
import 'package:music_app/presentation/pages/home_page.dart';
import 'package:music_app/presentation/pages/search_page.dart';
import 'package:music_app/presentation/pages/top_albums_page.dart';

class Routes {
  static getRoutes() {
    return {
      kHomePageRoute: (context) => HomePage(),
      kSearchPageRoute: (context) => BlocProvider<ArtistsBloc>.value(
            value: ArtistsBloc(getIt.get()),
            child: SearchPage(),
          ),
      kTopAlbumsPage: (context) => BlocProvider<TopAlbumsBloc>.value(
          value: TopAlbumsBloc(getIt.get()), child: TopAlbumPage()),
      kAlbumDetailsPage: (context) => BlocProvider<TracksBloc>.value(
          value: TracksBloc(getIt.get()), child: AlbumDetailsPage()),
    };
  }

  static const String kHomePageRoute = 'kHomePageRoute';
  static const String kSearchPageRoute = 'kSearchPageRoute';
  static const String kTopAlbumsPage = 'kTopAlbumsPage';
  static const String kAlbumDetailsPage = 'kAlbumDetailsPage';
}
