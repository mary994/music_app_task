import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/routes/routes.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/generated/app_text.dart';
import 'package:music_app/presentation/blocs/artists/bloc/artists_bloc.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';
import 'package:music_app/presentation/widgets/state_widget.dart';
import 'package:music_app/resources/resources.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final containerPadding = 8.0;
  final borderWidth = 0.5;

  ///search Controller
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _searchAppBar() {
    return AppBar(
      title: Container(
        padding: EdgeInsets.only(left: containerPadding),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: borderWidth),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: tr('search.hint_text'),
            hintStyle: Theme.of(context).textTheme.bodyText1,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        AppbarSearchButton(onClick: () {
          BlocProvider.of<ArtistsBloc>(context)
              .addSearchForArtist(_searchController.text);
        })
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ArtistsBloc, ArtistsState>(
      builder: (context, state) {
        return AppStateWidget<ArtistsState>(
          onRetry: () {
            BlocProvider.of<ArtistsBloc>(context)
                .addSearchForArtist(_searchController.text);
          },
          state: state,
          builder: (state, context) {
            if (state is ArtistSearchSucccssState) {
              return GridView.count(
                crossAxisCount: 2,
                children: state.artists
                    .map((e) => ArtistWidget(
                          e,
                          onClick: (artist) {
                            Navigator.pushNamed(context, Routes.kTopAlbumsPage,
                                arguments: artist);
                          },
                        ))
                    .toList(),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}

class ArtistWidget extends StatelessWidget {
  Function? onClick;
  ArtistWidget(this.artist, {this.onClick});
  Artist artist;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick?.call(artist);
      },
      child: Card(
        color: Colors.black,
        child: Stack(
          children: [
            Image.asset(Images.star),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    artist.name ?? '',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppConst.kAppSecondaryColor),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
