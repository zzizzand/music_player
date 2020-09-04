import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MusicSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      primaryColor: theme.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(elevation: 0),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(LineIcons.close), onPressed: () => query = ''),
      IconButton(icon: Icon(LineIcons.microphone), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
