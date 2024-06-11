import 'package:flutter/material.dart';
import 'package:le_spawn/models/video_game_item.dart';

class VideoGameItem extends StatelessWidget {
  const VideoGameItem({super.key, required this.videoGame, required this.apparence});

  final VideoGameItemModel videoGame;
  final String apparence;

  @override
  Widget build(BuildContext context) {
    Widget mainContent;

    switch (apparence) {
      case 'list':
        mainContent = ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          leading: AspectRatio(
            aspectRatio: 4 / 3,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.webp',
              image: videoGame.VideoGame.images[0],
              imageErrorBuilder: (context, error, stackTrace) => Image.asset('assets/images/placeholder.webp'),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(videoGame.VideoGame.title, overflow: TextOverflow.ellipsis),
          subtitle: Text('${videoGame.edition} · ${videoGame.region} · ${videoGame.VideoGame.Platform.name}'),
          trailing: const Icon(Icons.arrow_forward_ios),
        );
        break;

      case 'grid':
        mainContent = Card(
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.webp',
                image: videoGame.VideoGame.images[0],
                imageErrorBuilder: (context, error, stackTrace) => Image.asset('assets/images/placeholder.webp'),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.5),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [
                          0,
                          0.3,
                          1
                        ]),
                  ),
                ),
              ),
              Positioned(
                bottom: 6,
                left: 10,
                right: 10,
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 120,
                  ),
                  child: Text(
                    videoGame.VideoGame.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        break;

      default:
        mainContent = const Placeholder();
        break;
    }

    return mainContent;
  }
}
