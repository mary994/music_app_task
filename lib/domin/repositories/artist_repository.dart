import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/domin/usecases/artists/search_for_artist_params.dart';

abstract class ArtistRepository {
  Future<Resource> searchForArtist(SearchForArtistParams params);
  Future<Resource> getTopAlbums(Artist artist);
}
