import 'package:flutter/material.dart';
import 'package:le_spawn/models/video_game_item.dart';

class VideoGameItemDetails extends StatefulWidget {
  const VideoGameItemDetails({
    super.key,
    required this.videoGameItem,
  });

  final VideoGameItemModel videoGameItem;

  @override
  State<VideoGameItemDetails> createState() => _VideoGameItemDetailsState();
}

class _VideoGameItemDetailsState extends State<VideoGameItemDetails> {
  String get displayedProgression {
    switch (widget.videoGameItem.progression) {
      case 'NEVER_PLAYED':
        return 'Jamais joué';
      case 'IN_PROGRESS':
        return 'En cours';
      case 'ABANDONED':
        return 'Abandonné';
      case 'ALREADY_PLAYED':
        return 'Déjà joué';
      case 'POURCENT_100':
        return 'Complété à 100%';
      case 'POURCENT_200':
        return 'Complété à 200%';
      default:
        return widget.videoGameItem.progression;
    }
  }

  void _openImagesFullscreen() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (modalContext) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              itemCount: widget.videoGameItem.photos.length,
              itemBuilder: (context, index) {
                return InteractiveViewer(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder.webp',
                    image: widget.videoGameItem.photos[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _openImagesFullscreen,
                child: ItemHeader(widget: widget),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemTitleContainer(widget: widget),
                    const SizedBox(height: 12),
                    ItemDetails(widget: widget, displayedProgression: displayedProgression),
                    if (widget.videoGameItem.Content.isNotEmpty) const SizedBox(height: 24),
                    if (widget.videoGameItem.Content.isNotEmpty) ItemContents(videoGameItem: widget.videoGameItem),
                    const SizedBox(height: 24),
                    ItemDescription(widget: widget),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemHeader extends StatelessWidget {
  const ItemHeader({
    super.key,
    required this.widget,
  });

  final VideoGameItemDetails widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage.assetNetwork(
          placeholder: 'assets/images/placeholder.webp',
          image: widget.videoGameItem.VideoGame.images[0],
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        if (widget.videoGameItem.photos.isNotEmpty)
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '+ ${widget.videoGameItem.photos.length} photos',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
      ],
    );
  }
}

class ItemTitleContainer extends StatelessWidget {
  const ItemTitleContainer({
    super.key,
    required this.widget,
  });

  final VideoGameItemDetails widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/placeholder.webp',
            image: widget.videoGameItem.VideoGame.Platform.logoSquare,
            height: 64,
            width: 64,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.videoGameItem.VideoGame.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${widget.videoGameItem.region} · ${widget.videoGameItem.edition}',
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ],
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.widget,
    required this.displayedProgression,
  });

  final VideoGameItemDetails widget;
  final String displayedProgression;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Détails'),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.category_outlined, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    widget.videoGameItem.VideoGame.genres.join(', '),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.gamepad_outlined, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    displayedProgression,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemContents extends StatelessWidget {
  const ItemContents({
    super.key,
    required this.videoGameItem,
  });

  final VideoGameItemModel videoGameItem;

  String _getDisplayedState(String state) {
    switch (state) {
      case 'NEW':
        return 'Neuf';
      case 'MINT':
        return 'Comme neuf';
      case 'GOOD':
        return 'Bon état';
      case 'BAD':
        return 'Mauvais état';
      case 'BROKEN':
        return 'Très mauvais état';
      default:
        return 'Bon état';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contenu'),
        const SizedBox(height: 4),
        GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: videoGameItem.Content.map(
            (content) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(content.name),
                  const SizedBox(height: 4),
                  Text(_getDisplayedState(content.state)),
                ],
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }
}

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    super.key,
    required this.widget,
  });

  final VideoGameItemDetails widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description'),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.videoGameItem.VideoGame.description ?? 'Aucune description',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
