import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SongRepos extends Cubit<List<SongInfo>> {
  final FlutterAudioQuery audioQuery;

  SongRepos(this.audioQuery) : super([]) {
    load();
  }

  load() async {
    emit(await audioQuery.getSongs());
  }

  List<SongInfo> operator [](String albumId) {
    return state.where((element) => element.albumId == albumId).toList();
  }
}
