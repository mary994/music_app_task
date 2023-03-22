import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/generated/app_text.dart';
import 'package:music_app/presentation/blocs/tracks/bloc/tracks_bloc.dart';
import 'package:music_app/presentation/widgets/space.dart';
import 'package:music_app/presentation/widgets/state_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:music_app/presentation/widgets/tite_description_widget.dart';

class AlbumDetailsPage extends StatefulWidget {
  AlbumDetailsPage({Key? key}) : super(key: key);

  @override
  _AlbumDetailsPageState createState() => _AlbumDetailsPageState();
}

class _AlbumDetailsPageState extends State<AlbumDetailsPage> {
  Album? album;
  @override
  void didChangeDependencies() {
    album = ModalRoute.of(context)!.settings.arguments as Album;
    BlocProvider.of<TracksBloc>(context).getTracks(album!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConst.kMaterialAppTitle,
            style: Theme.of(context).textTheme.headline2?.copyWith()),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<TracksBloc, TracksState>(
        builder: (context, state) {
          return AppStateWidget(
            builder: (state, context) {
              if (state is TracksSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetails(state.album),
                      state.album.tracks != null
                          ? const VerticalSpace(10)
                          : Container(),
                      state.album.tracks != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${album?.name ?? ''} ${tr('albums.tracks')}:',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: AppConst.kAppSecondaryColor,
                                        fontSize: 18),
                              ),
                            )
                          : Container(),
                      state.album.tracks != null
                          ? const VerticalSpace(10)
                          : Container(),
                      ...(List.generate(
                          state.album.tracks?.length ?? 0,
                          (index) => Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                    '${index + 1}-${state.album.tracks?[index].name ?? ''}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: AppConst.kAppSecondaryColor
                                                .withOpacity(0.7),
                                            fontSize: 18)),
                              )))
                    ],
                  ),
                );
              }
            },
            state: state,
          );
        },
      ),
    );
  }

  Widget _buildDetails(Album album) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: album.albumImage ?? '',
          height: 300,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        const VerticalSpace(5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TitleDescriptionWidget(
            title: tr('details.album'),
            body: album.name,
          ),
        ),
        const VerticalSpace(5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TitleDescriptionWidget(
            title: tr('details.artist'),
            body: album.artist?.name,
          ),
        )
      ],
    );
  }

  Widget _buildTracks(Album album) {
    return Container(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Text(
              album.tracks?[index].name ?? '',
              style: Theme.of(context).textTheme.bodyText1,
            );
          },
          separatorBuilder: (context, index) {
            return const VerticalSpace(5);
          },
          itemCount: album.tracks?.length ?? 0),
    );
  }
}
