import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:music_app/domin/entities/artist.dart';
part 'artist_search_response.g.dart';

@JsonSerializable()
class ArtistSearchResponse {
  ArtistSearchResponse({this.results});
  factory ArtistSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtistSearchResponseFromJson(json);

  Result? results;
}

@JsonSerializable()
class Result {
  Result(
      {this.artistMatches,
      this.itemsPerPage,
      this.startIndex,
      this.totalResults});
  @JsonKey(name: 'opensearch:totalResults')
  String? totalResults;
  @JsonKey(name: 'opensearch:startIndex')
  String? startIndex;
  @JsonKey(name: 'opensearch:itemsPerPage')
  String? itemsPerPage;
  @JsonKey(name: 'artistmatches')
  ArtistMatches? artistMatches;
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@JsonSerializable()
class ArtistMatches {
  ArtistMatches({this.artist});
  List<ArtistModel>? artist;
  factory ArtistMatches.fromJson(Map<String, dynamic> json) =>
      _$ArtistMatchesFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 1)
class ArtistModel extends HiveObject implements Artist {
  ArtistModel(
      {this.image,
      this.listeners,
      this.mbid,
      this.name,
      this.streamable,
      this.url});

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
  static Artist fromJsonBuilder(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
  static Map<String, dynamic> toJsonBuilder(Artist? artist) {
    return artist != null ? _$ArtistModelToJson(artist as ArtistModel) : {};
  }

  @override
  String? listeners;

  @HiveField(0)
  @override
  String? mbid;

  @HiveField(1)
  @override
  String? name;

  @override
  String? streamable;

  @override
  String? url;

  List<ImageModel>? image;

  @override
  String getImage() {
    return image?.last.text ?? '';
  }
}

@JsonSerializable()
class ImageModel {
  ImageModel({this.text});
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  @JsonKey(name: '#text')
  String? text;
}
