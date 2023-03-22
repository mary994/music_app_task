import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';
import 'package:music_app/data/model/album/get_album_tracks_response.dart';
import 'package:music_app/data/model/artist/artist_search_response.dart';
import 'package:music_app/data/model/artist/get_top_albums_response.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/domin/entities/track.dart';

@Singleton()
class AppDataBase {
  Future<Box<AlbumModel>> _getAlbumBox() async {
    return await Hive.openBox<AlbumModel>('albums');
  }

  Future<Box<TrackModel>> _getTrackBox(String albumId) async {
    return await Hive.openBox<TrackModel>(albumId);
  }

  Future<Box<ArtistModel>> _getArtistBox() async {
    return await Hive.openBox<ArtistModel>('artists');
  }

  Future<void> deleteAlbum(AlbumModel album) async {
    Box<AlbumModel> box = await _getAlbumBox();
    box.deleteAt(box.values.toList().cast().indexOf(album));

    Box<TrackModel> trackBox = await _getTrackBox(album.mbid!);
    Box<ArtistModel> artistBox = await _getArtistBox();
    artistBox.delete(album.mbid);
    trackBox.clear();
  }

  Future<void> saveAlbum(AlbumModel album) async {
    var box = await _getAlbumBox();
    box.add(album);
    var artistBox = await _getArtistBox();
    artistBox.put(album.mbid, album.artist! as ArtistModel);
    var trackBox = await _getTrackBox(album.mbid!);
    if (album.tracks != null) {
      for (Track t in album.tracks!) {
        trackBox.add(t as TrackModel);
      }
    }
  }

  Future<List<AlbumModel>> getFavoritesAlbums() async {
    Box<AlbumModel> box = await _getAlbumBox();
    List<AlbumModel> list = box.values.toList().cast();
    var artistBox = await _getArtistBox();

    for (AlbumModel album in list) {
      album.artist = artistBox.get(album.mbid);
      var trackBox = await _getTrackBox(album.mbid!);
      album.tracks = trackBox.values.toList().cast();
    }
    return list;
  }

  Future<void> addTracks(List<TrackModel> tracks, AlbumModel album) async {
    var box = await _getTrackBox(album.mbid!);
    for (Track t in album.tracks!) {
      box.add(t as TrackModel);
    }
  }
}
