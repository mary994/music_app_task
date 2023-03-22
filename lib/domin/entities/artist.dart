import 'package:hive/hive.dart';
import 'package:music_app/data/model/artist/artist_search_response.dart';

abstract class Artist extends HiveObject {
  String? name;
  String? listeners;
  String? mbid;

  String? url;

  String? streamable;
}
