import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/data/model/album/get_album_tracks_response.dart';
import 'package:music_app/data/model/artist/artist_search_response.dart';
import 'package:music_app/domin/entities/album.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:hive/hive.dart';
import 'package:music_app/domin/entities/track.dart';

part 'get_top_albums_response.g.dart';

@JsonSerializable()
class GetTopAlbumsResponse {
  GetTopAlbumsResponse({this.topAlbums});
  @JsonKey(name: 'topalbums')
  TopAlbums? topAlbums;
  factory GetTopAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTopAlbumsResponseFromJson(json);
}

@JsonSerializable()
class TopAlbums {
  TopAlbums({this.album});
  List<AlbumModel>? album;
  factory TopAlbums.fromJson(Map<String, dynamic> json) =>
      _$TopAlbumsFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 0)
class AlbumModel extends HiveObject implements Album, Equatable {
  AlbumModel(
      {this.artist,
      this.image,
      this.mbid,
      this.name,
      this.playcount,
      this.url,
      this.tracks,
      this.isFavorite,
      this.albumImage});
  // @HiveField(7)
  @JsonKey(ignore: true)
  @override
  List<Track>? tracks;

  // @HiveField(6)
  @JsonKey(
      fromJson: ArtistModel.fromJsonBuilder, toJson: ArtistModel.toJsonBuilder)
  @override
  Artist? artist;

  @HiveField(0)
  @override
  String? mbid;

  @HiveField(1)
  @override
  String? name;

  @HiveField(2)
  @override
  int? playcount;

  @HiveField(3)
  @override
  String? url;

  @HiveField(4)
  @override
  String? albumImage;
  @HiveField(5)
  @override
  bool? isFavorite;
  List<ImageModel>? image;
  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    AlbumModel album = _$AlbumModelFromJson(json);
    album.albumImage = album.image?.last.text;
    return album;
  }

  @override
  List<Object?> get props => [mbid];
  @override
  bool? get stringify => true;
}
