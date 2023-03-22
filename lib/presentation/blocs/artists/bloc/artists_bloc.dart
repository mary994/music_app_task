import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/core/state/state_types.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/domin/usecases/artists/search_for_artist.dart';
import 'package:music_app/domin/usecases/artists/search_for_artist_params.dart';

part 'artists_event.dart';
part 'artists_state.dart';

class ArtistsBloc extends Bloc<ArtistsEvent, ArtistsState> {
  SearchForArtist searchForArtist;
  ArtistsBloc(this.searchForArtist) : super(ArtistsInitial()) {
    on<ArtistsEvent>((event, emit) async {
      if (event is ArtistsSearchEvent) {
        _artistsSearchEvent(event);
      }
    });
  }
  _artistsSearchEvent(ArtistsSearchEvent event) async {
    emit(ArtistSearchLoadingState());
    Resource res = await searchForArtist.call(params: event.params);
    if (res is SuccessResource) {
      emit(ArtistSearchSucccssState(res.data));
    } else {
      emit(ArtistSearchFailedState(res as FailedResource));
    }
    // add(ArtistsSearchResultEvent(res));
  }

  // _artistSearchResultEvent(ArtistsSearchResultEvent artistsSearchResultEvent) {
  //   var res = artistsSearchResultEvent.resource;
  //   if (res is SuccessResource) {
  //     emit(ArtistSearchSucccssState(res.data));
  //   } else {
  //     emit(ArtistSearchFailedState(res as FailedResource));
  //   }
  // }

  void addSearchForArtist(String artist) {
    add(ArtistsSearchEvent(SearchForArtistParams(artist)));
  }
}
