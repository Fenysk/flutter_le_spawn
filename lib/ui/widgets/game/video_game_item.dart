import 'package:flutter/material.dart';
import 'package:le_spawn/models/video_game.dart';

class VideoGameItem extends StatelessWidget {
  const VideoGameItem(
      {super.key, required this.videoGame, required this.apparence});

  final VideoGame videoGame;
  final String apparence;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Card(
      child: ListTile(
        leading: Image(image: NetworkImage(videoGame.mainPhoto)),
        title: Text(videoGame.title),
        subtitle: Text(videoGame.edition),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );

    if (apparence == 'grid') {
      mainContent = Card(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Image(
              image: NetworkImage(videoGame.mainPhoto),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right:
                  10, // Ajoutez cette ligne pour définir une largeur maximale
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth:
                      120, // Définissez une largeur maximale pour le conteneur
                ),
                child: Text(
                  videoGame.title,
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
    }

    return mainContent;
  }
}
