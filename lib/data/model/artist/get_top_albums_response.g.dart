// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_top_albums_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumModelAdapter extends TypeAdapter<AlbumModel> {
  @override
  final int typeId = 0;

  @override
  AlbumModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumModel(
      mbid: fields[0] as String?,
      name: fields[1] as String?,
      playcount: fields[2] as int?,
      url: fields[3] as String?,
      albumImage: fields[4] as String?,
    )..isFavorite = fields[5] as bool?;
  }

  @override
  void write(BinaryWriter writer, AlbumModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mbid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.playcount)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.albumImage)
      ..writeByte(5)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTopAlbumsResponse _$GetTopAlbumsResponseFromJson(
        Map<String, dynamic> json) =>
    GetTopAlbumsResponse(
      topAlbums: json['topalbums'] == null
          ? null
          : TopAlbums.fromJson(json['topalbums'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTopAlbumsResponseToJson(
        GetTopAlbumsResponse instance) =>
    <String, dynamic>{
      'topalbums': instance.topAlbums,
    };

TopAlbums _$TopAlbumsFromJson(Map<String, dynamic> json) => TopAlbums(
      album: (json['album'] as List<dynamic>?)
          ?.map((e) => AlbumModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopAlbumsToJson(TopAlbums instance) => <String, dynamic>{
      'album': instance.album,
    };

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) => AlbumModel(
      artist:
          ArtistModel.fromJsonBuilder(json['artist'] as Map<String, dynamic>),
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mbid: json['mbid'] as String?,
      name: json['name'] as String?,
      playcount: json['playcount'] as int?,
      url: json['url'] as String?,
      albumImage: json['albumImage'] as String?,
    )..isFavorite = json['isFavorite'] as bool?;

Map<String, dynamic> _$AlbumModelToJson(AlbumModel instance) =>
    <String, dynamic>{
      'artist': ArtistModel.toJsonBuilder(instance.artist),
      'mbid': instance.mbid,
      'name': instance.name,
      'playcount': instance.playcount,
      'url': instance.url,
      'albumImage': instance.albumImage,
      'isFavorite': instance.isFavorite,
      'image': instance.image,
    };
