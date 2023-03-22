part of 'artists_bloc.dart';

abstract class ArtistsEvent extends Equatable {
  const ArtistsEvent();

  @override
  List<Object> get props => [];
}

class ArtistsSearchEvent extends ArtistsEvent {
  ArtistsSearchEvent(this.params);
  SearchForArtistParams params;
  @override
  List<Object> get props => [params.artist];
}

// // ignore: must_be_immutable
// class ArtistsSearchResultEvent extends ArtistsEvent {
//   ArtistsSearchResultEvent(this.resource);
//   Resource resource;
//   @override
//   List<Object> get props => [];
// }
