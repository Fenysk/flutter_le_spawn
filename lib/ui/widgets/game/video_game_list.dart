import 'package:flutter/material.dart';
import 'package:le_spawn/ui/widgets/game/video_game_item.dart';
import 'package:le_spawn/data/video_game_data.dart';
import 'package:le_spawn/models/video_game.dart';

class VideoGameList extends StatelessWidget {
  VideoGameList({super.key});

  final List<VideoGame> videoGameList = videoGameData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoGameList.length,
      itemBuilder: (context, index) =>
          VideoGameItem(videoGame: videoGameList[index]),
    );
  }
}
