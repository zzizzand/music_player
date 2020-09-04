import 'package:flutter/material.dart';
import 'package:music_player/generated/l10n.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  final filters = [true, true, true, true, true];
  final List result = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final strings = S.of(context);
    var divider = Divider(height: 1);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          divider,
          buildFilters(strings),
          _buildResult(),
        ],
      ),
    );
  }

  SizedBox buildFilters(S strings) {
    final filterLabels = [
      strings.album,
      strings.artist,
      strings.playlist,
      strings.genre,
      strings.song,
    ];
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => FilterChip(
          label: Text(filterLabels[index]),
          selected: filters[index],
          onSelected: (value) => setState(() => filters[index] = value),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 16),
        itemCount: filters.length,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final h6 = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontWeight: FontWeight.normal);
    final strings = S.of(context);
    return AppBar(
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: colors.background,
      brightness: Theme.of(context).brightness,
      iconTheme: IconThemeData(color: colors.onBackground.withOpacity(0.5)),
      titleSpacing: 0,
      title: TextFormField(
        controller: _controller,
        autofocus: true,
        style: h6.copyWith(fontWeight: FontWeight.normal),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: strings.searchHint,
          contentPadding: EdgeInsets.zero,
          hintStyle: h6.apply(color: colors.onBackground.withOpacity(0.5)),
          border: InputBorder.none,
        ),
      ),
      actions: [CloseButton(onPressed: () => _controller.text = "")],
    );
  }

  Widget _buildResult() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(height: 100);
        },
      ),
    );
  }
}
