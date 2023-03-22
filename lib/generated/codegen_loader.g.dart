// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "search": {
    "hint_text": "Search for albums"
  },
  "error": {
    "try_again": "Try again",
    "message": "Somthin wrong happens!",
    "unable_save_album": "Sorry! we are unable to save your album {}"
  },
  "albums": {
    "title": "{} Top Albums",
    "tracks": "Tracks"
  },
  "home": {
    "no_albums_added": "No Albums added yet"
  },
  "details": {
    "artist": "Artist",
    "album": "Album"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
