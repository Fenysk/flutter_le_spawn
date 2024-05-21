import 'package:flutter/material.dart';
import 'package:le_spawn/models/video_game.dart';

class VideoGameItem extends StatelessWidget {
  const VideoGameItem({super.key, required this.videoGame});

  final VideoGame videoGame;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 200,
        child: Placeholder(
          child: Text(videoGame.title),
        ),
      ),
    );
  }
}
