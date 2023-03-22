import 'package:injectable/injectable.dart';
import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/core/usecase/usecase.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/domin/repositories/artist_repository.dart';
import 'package:music_app/domin/usecases/artists/search_for_artist_params.dart';

@LazySingleton()
class SearchForArtist implements UseCase<Resource, SearchForArtistParams> {
  SearchForArtist(this.repository);
  ArtistRepository repository;
  @override
  Future<Resource> call({SearchForArtistParams? params}) async {
    return repository.searchForArtist(params!);
  }
}
