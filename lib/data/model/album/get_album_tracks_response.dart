import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/domin/entities/track.dart';
part 'get_album_tracks_response.g.dart';

@JsonSerializable()
class GetAlbumTracksResponse {
  GetAlbumTracksResponse({this.album});
  AlbumDetails? album;
  factory GetAlbumTracksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAlbumTracksResponseFromJson(json);
}

@JsonSerializable()
class AlbumDetails {
  AlbumDetails({this.tracks});
  factory AlbumDetails.fromJson(Map<String, dynamic> json) =>
      _$AlbumDetailsFromJson(json);

  TraksHolder? tracks;
}

@JsonSerializable()
class TraksHolder {
  TraksHolder({this.track});
  List<TrackModel>? track;
  factory TraksHolder.fromJson(Map<String, dynamic> json) =>
      _$TraksHolderFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 33)
class TrackModel implements Track {
  TrackModel({this.duration, this.name, this.url});
  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);
  @HiveField(0)
  @override
  int? duration;
  @HiveField(1)
  @override
  String? name;
  @HiveField(2)
  @override
  String? url;
}
