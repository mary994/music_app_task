import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:music_app/core/routes/routes.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/data/model/album/get_album_tracks_response.dart';
import 'package:music_app/data/model/artist/artist_search_response.dart';
import 'package:music_app/domin/entities/artist.dart';
import 'package:music_app/domin/entities/track.dart';
import 'package:music_app/injection.dart';
import 'package:music_app/generated/codegen_loader.g.dart';
import 'package:music_app/presentation/blocs/favorite_albums/bloc/favorite_albums_bloc.dart';
import 'package:music_app/presentation/pages/home_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:music_app/data/model/artist/get_top_albums_response.dart';

void main() async {
  configureDependencies(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  Directory? dir = await getTemporaryDirectory();

  Hive.init(dir.path);
  Hive.registerAdapter<AlbumModel>(AlbumModelAdapter());
  Hive.registerAdapter<ArtistModel>(ArtistModelAdapter());
  Hive.registerAdapter<TrackModel>(TrackModelAdapter());

  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      assetLoader: const CodegenLoader(),
      path: './assets/translations/',
      fallbackLocale: AppConst.kSupportedLocals.first,
      supportedLocales: AppConst.kSupportedLocals,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<FavoriteAlbumsBloc>.value(value: getIt.get())],
        child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: AppConst.kMaterialAppTitle,
            theme: AppConst.getAppTheme(),
            initialRoute: Routes.kHomePageRoute,
            home: HomePage(),
            routes: Routes.getRoutes()));
  }
}
