import 'package:injectable/injectable.dart';
import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/core/usecase/usecase.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/domin/repositories/artist_repository.dart';

@LazySingleton()
class GetTopAlbums extends UseCase<Resource, Artist> {
  ArtistRepository artistRepository;
  GetTopAlbums(this.artistRepository);
  @override
  Future<Resource> call({Artist? params}) {
    return artistRepository.getTopAlbums(params!);
  }
}
