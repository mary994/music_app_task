import 'package:equatable/equatable.dart';

class SearchForArtistParams extends Equatable {
  SearchForArtistParams(this.artist);
  String artist;

  @override
  // TODO: implement props
  List<Object?> get props => [artist];
}
