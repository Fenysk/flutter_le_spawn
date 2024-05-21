import 'package:flutter/material.dart';
import 'package:le_spawn/ui/widgets/game/video_game_item.dart';

class VideoGameList extends StatelessWidget {
  const VideoGameList({super.key, required this.items});

  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => const VideoGameItem(),
    );
  }
}
