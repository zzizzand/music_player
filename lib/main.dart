import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_player/states/Song_repos.dart';
import 'package:music_player/states/albums_state.dart';
import 'package:music_player/ui/screens/home_screen.dart';

import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final _audioQuery = FlutterAudioQuery();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AlbumState(_audioQuery), lazy: false),
        BlocProvider(create: (context) => SongRepos(_audioQuery), lazy: false),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        theme: ThemeData.from(colorScheme: ColorScheme.light()).copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()},
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
