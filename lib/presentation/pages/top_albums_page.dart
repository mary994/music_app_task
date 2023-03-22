import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/routes/routes.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/data/model/artist/artist_search_response.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/generated/app_text.dart';
import 'package:music_app/presentation/blocs/albums/bloc/top_albums_bloc.dart';
import 'package:music_app/presentation/blocs/favorite_albums/bloc/favorite_albums_bloc.dart';
import 'package:music_app/presentation/widgets/album_widget.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';
import 'package:music_app/presentation/widgets/state_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TopAlbumPage extends StatefulWidget {
  TopAlbumPage({Key? key}) : super(key: key);

  @override
  _TopAlbumPageState createState() => _TopAlbumPageState();
}

class _TopAlbumPageState extends State<TopAlbumPage> {
  Artist? artist;
  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null)
      artist = ModalRoute.of(context)!.settings.arguments as Artist;

    artist = artist ?? ArtistModel(mbid: '1231', name: 'e31231');
    BlocProvider.of<TopAlbumsBloc>(context).getTopAlbumsEvent(artist!);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(tr('albums.title', args: [artist?.name ?? '']),
            style: Theme.of(context).textTheme.headline2?.copyWith()),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocListener<FavoriteAlbumsBloc, FavoriteAlbumsState>(
        listener: (context, state) {
          if (state is FavoriteAlbumsSuccessState) {
            if (state.saveFailed ?? false) {
              BlocProvider.of<TopAlbumsBloc>(context)
                  .getTopAlbumsEvent(artist!);
              Fluttertoast.showToast(
                  msg: tr('error.unable_save_album',
                      args: [state.album?.name ?? '']));
            }
          }
        },
        child: BlocBuilder<TopAlbumsBloc, TopAlbumsState>(
          builder: (context, state) {
            return AppStateWidget(
                onRetry: () {
                  BlocProvider.of<TopAlbumsBloc>(context)
                      .getTopAlbumsEvent(artist!);
                },
                builder: (state, context) {
                  if (state is TopAlbumsSuccessState) {
                    return _buildBody(state.successResource.data);
                  }
                },
                state: state);
          },
        ),
      ),
    );
  }

  Widget _buildBody(List<Album> albums) {
    return GridView.count(
      crossAxisCount: 2,
      children: albums
          .map((e) => AlbumsWidget(e, onClick: () {
                Navigator.pushNamed(context, Routes.kAlbumDetailsPage,
                    arguments: e);
              }, onFavoriteClick: (_isFav) {
                if (_isFav) {
                  BlocProvider.of<FavoriteAlbumsBloc>(context).addAlbum(e);
                } else {
                  BlocProvider.of<FavoriteAlbumsBloc>(context).deleteAlbum(e);
                }
              }, key: ValueKey('${e.mbid}${e.isFavorite.toString()}')))
          .toList(),
    );
  }
}
