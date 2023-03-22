import 'package:equatable/equatable.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/domin/entities/track.dart';

abstract class Album implements Equatable {
  String? name;
  int? playcount;
  String? mbid;
  String? url;
  Artist? artist;
  String? albumImage;
  @override
  List<Object?> get props => [mbid];
  @override
  bool? get stringify => true;
  bool? isFavorite;
  List<Track>? tracks;
}
