import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/states/albums_state.dart';
import 'package:music_player/ui/screens/search_screen.dart';
import 'package:music_player/ui/widgets/album_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocBuilder<AlbumState, List<AlbumInfo>>(
        builder: (context, albums) => CustomScrollView(
          slivers: <Widget>[
            _buildAppBar(),
            _buildBody(albums: albums),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      floating: true,
      title: Text("Albums"),
      centerTitle: true,
      leading: IconButton(icon: Icon(LineIcons.user_plus), onPressed: () {}),
      actions: [
        IconButton(icon: Icon(LineIcons.filter), onPressed: () {}),
        IconButton(
          icon: Icon(LineIcons.search),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SearchScreen()),
          ),
        ),
      ],
    );
  }

  SliverPadding _buildBody({List<AlbumInfo> albums}) {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final album = albums[index];
            return AlbumItem(key: ValueKey(album.id), album: album);
          },
          childCount: albums.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
      ),
    );
  }
}
