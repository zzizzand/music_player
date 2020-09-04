import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/ui/screens/album_view_screen.dart';

class AlbumItem extends StatelessWidget {
  final AlbumInfo album;

  const AlbumItem({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 16,
      shape: ContinuousRectangleBorder(),
      child: InkWell(
        onTap: () => _navigateTo(context),
        child: Column(
          children: [
            AspectRatio(aspectRatio: 1, child: _buildAlbumArt()),
            Expanded(child: _buildTestDescriptions(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildTestDescriptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(album.title, overflow: TextOverflow.ellipsis),
          Text(
            album.artist,
            style: Theme.of(context).textTheme.caption,
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumArt() {
    if (album.albumArt != null)
      return Image.file(
        File(album.albumArt),
        fit: BoxFit.cover,
      );
    return Container(
      child: Icon(Icons.album, size: 150),
      color: Colors.black12,
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(),
    );
  }

  void _navigateTo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AlbumViewScreen(album: album)),
    );
  }
}
