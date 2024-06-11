import 'package:flutter/material.dart';
import 'package:le_spawn/ui/widgets/game/video_game_item.dart';
import 'package:le_spawn/data/video_game_item_data.dart';
import 'package:le_spawn/models/video_game_item.dart';

class VideoGameList extends StatelessWidget {
  VideoGameList({super.key, required this.appearance});

  final List<VideoGameItemModel> videoGameList = videoGameItemData;
  final String appearance;

  @override
  Widget build(BuildContext context) {
    Widget mainContent;

    switch (appearance) {
      case 'list':
        mainContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jeux-vidéo',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: ListView.builder(
                itemCount: videoGameList.length,
                itemBuilder: (context, index) => VideoGameItem(
                  videoGameItem: videoGameList[index],
                  apparence: appearance,
                ),
              ),
            ),
          ],
        );
        break;

      case 'grid':
        mainContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jeux-vidéo',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                itemCount: videoGameList.length,
                itemBuilder: (context, index) => VideoGameItem(
                  videoGameItem: videoGameList[index],
                  apparence: appearance,
                ),
              ),
            ),
          ],
        );
        break;

      default:
        mainContent = const Placeholder();
        break;
    }

    return mainContent;
  }
}
