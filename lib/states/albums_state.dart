import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumState extends Cubit<List<AlbumInfo>> {
  final FlutterAudioQuery _audioQuery;

  AlbumState(this._audioQuery) : super([]) {
    load();
  }

  load() async {
    emit(await _audioQuery.getAlbums());
  }

  AlbumInfo getAlbumById(String id) {
    return state.singleWhere((element) => element.id == id);
  }

  AlbumInfo getAlbumByName(String name) {
    return state.singleWhere((element) => element.title == name);
  }
}
