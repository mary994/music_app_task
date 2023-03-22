import 'package:injectable/injectable.dart';
import 'package:music_app/core/resource/resource.dart';
import 'package:music_app/core/usecase/usecase.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/repositories/albums_repository.dart';

@LazySingleton()
class DeleteAlbumFromFavoriteList extends UseCase<Resource, Album> {
  AlbumsRepository albumsRepository;
  DeleteAlbumFromFavoriteList(this.albumsRepository);
  @override
  Future<Resource> call({Album? params}) {
    return albumsRepository.deleteAlbum(params!);
  }
}
