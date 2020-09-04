import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/utils/extensions/date_time.dart';

class SongItem extends StatelessWidget {
  const SongItem({Key key, @required this.song, this.onTap, this.onTrailingTap})
      : super(key: key);

  final SongInfo song;
  final Function onTap;
  final Function onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.all(4),
      child: ListTile(
        leading: CircleAvatar(child: Icon(LineIcons.music)),
        title: Text(song.title, overflow: TextOverflow.ellipsis),
        subtitle: Row(
          children: [
            Expanded(child: Text(song.artist, overflow: TextOverflow.ellipsis)),
            Text(song.duration.timeFormat),
          ],
        ),
        trailing: SizedBox(
          width: 36,
          child: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: onTrailingTap,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
