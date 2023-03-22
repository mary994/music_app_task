// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_search_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArtistModelAdapter extends TypeAdapter<ArtistModel> {
  @override
  final int typeId = 1;

  @override
  ArtistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArtistModel(
      mbid: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArtistModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mbid)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArtistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistSearchResponse _$ArtistSearchResponseFromJson(
        Map<String, dynamic> json) =>
    ArtistSearchResponse(
      results: json['results'] == null
          ? null
          : Result.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtistSearchResponseToJson(
        ArtistSearchResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      artistMatches: json['artistmatches'] == null
          ? null
          : ArtistMatches.fromJson(
              json['artistmatches'] as Map<String, dynamic>),
      itemsPerPage: json['opensearch:itemsPerPage'] as String?,
      startIndex: json['opensearch:startIndex'] as String?,
      totalResults: json['opensearch:totalResults'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'opensearch:totalResults': instance.totalResults,
      'opensearch:startIndex': instance.startIndex,
      'opensearch:itemsPerPage': instance.itemsPerPage,
      'artistmatches': instance.artistMatches,
    };

ArtistMatches _$ArtistMatchesFromJson(Map<String, dynamic> json) =>
    ArtistMatches(
      artist: (json['artist'] as List<dynamic>?)
          ?.map((e) => ArtistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistMatchesToJson(ArtistMatches instance) =>
    <String, dynamic>{
      'artist': instance.artist,
    };

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) => ArtistModel(
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      listeners: json['listeners'] as String?,
      mbid: json['mbid'] as String?,
      name: json['name'] as String?,
      streamable: json['streamable'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'listeners': instance.listeners,
      'mbid': instance.mbid,
      'name': instance.name,
      'streamable': instance.streamable,
      'url': instance.url,
      'image': instance.image,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      text: json['#text'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      '#text': instance.text,
    };
