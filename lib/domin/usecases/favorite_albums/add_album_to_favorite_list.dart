import 'package:injectable/injectable.dart';
import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/core/usecase/usecase.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/repositories/albums_repository.dart';

@LazySingleton()
class AddAlbumFromFavoriteList extends UseCase<Resource, Album> {
  AlbumsRepository albumsRepository;
  AddAlbumFromFavoriteList(this.albumsRepository);
  @override
  Future<Resource> call({Album? params}) {
    return albumsRepository.saveAlbum(params!);
  }
}
