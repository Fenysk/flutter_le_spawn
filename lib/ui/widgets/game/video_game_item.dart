import 'package:flutter/material.dart';
import 'package:le_spawn/models/video_game_item.dart';
import 'package:le_spawn/ui/widgets/game/video_game_item_details.dart';
import 'package:le_spawn/utils/constants.dart';

class VideoGameItem extends StatefulWidget {
  const VideoGameItem({super.key, required this.videoGameItem, required this.apparence});

  final VideoGameItemModel videoGameItem;
  final String apparence;

  @override
  State<VideoGameItem> createState() => _VideoGameItemState();
}

class _VideoGameItemState extends State<VideoGameItem> {
  void _openItemDetails() {
    showModalBottomSheet(
      context: context,
      builder: (modalContext) => VideoGameItemDetails(
        videoGameItem: widget.videoGameItem,
      ),
      isScrollControlled: true,
      useSafeArea: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent;

    switch (widget.apparence) {
      case 'list':
        mainContent = ListTile(
          onTap: _openItemDetails,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          leading: AspectRatio(
            aspectRatio: 4 / 3,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.webp',
              image: widget.videoGameItem.VideoGame.images[0],
              imageErrorBuilder: (context, error, stackTrace) => Image.asset('assets/images/placeholder.webp'),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(widget.videoGameItem.VideoGame.title, overflow: TextOverflow.ellipsis),
          subtitle: Text('${widget.videoGameItem.edition} · ${widget.videoGameItem.VideoGame.Platform.name}'),
          trailing: const Icon(
            Icons.info_outline,
            // color: AppColors.accent,
          ),
        );
        break;

      case 'grid':
        mainContent = GestureDetector(
          onTap: _openItemDetails,
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder.webp',
                  image: widget.videoGameItem.VideoGame.images[0],
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
                      widget.videoGameItem.VideoGame.title,
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
