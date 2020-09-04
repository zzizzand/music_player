import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/states/Song_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/ui/screens/search_screen.dart';
import 'package:music_player/ui/widgets/search_delegate.dart';
import 'package:music_player/ui/widgets/song_item.dart';

class AlbumViewScreen extends StatefulWidget {
  final AlbumInfo album;

  const AlbumViewScreen({Key key, @required this.album}) : super(key: key);

  @override
  _AlbumViewScreenState createState() => _AlbumViewScreenState();
}

class _AlbumViewScreenState extends State<AlbumViewScreen>
    with SingleTickerProviderStateMixin {
  List<SongInfo> songs = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    songs = context.bloc<SongRepos>()[widget.album.id];
    print("Dependant changed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocBuilder<SongRepos, List<SongInfo>>(
        builder: (context, state) => CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            _buildAppBar(context),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  SliverPadding _buildBody() {
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildSongItem(context, songs[index]),
          childCount: songs.length,
          addRepaintBoundaries: true,
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    var windowHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: windowHeight * 0.4,
      actions: [
        IconButton(icon: Icon(LineIcons.search), onPressed: _search),
        IconButton(icon: Icon(LineIcons.star_o), onPressed: () {}),
        IconButton(icon: Icon(Icons.playlist_add), onPressed: () {}),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Hero(
          tag: widget.album.albumArt,
          child: Image.file(File(widget.album.albumArt), fit: BoxFit.cover),
        ),
        stretchModes: [StretchMode.fadeTitle, StretchMode.zoomBackground],
      ),
      stretch: true,
      pinned: true,
    );
  }

  Widget _buildSongItem(BuildContext context, SongInfo item) {
    return SongItem(
      song: item,
      onTap: () {},
    );
  }

  void _search() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen()));
  }
}
