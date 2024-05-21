import 'package:flutter/material.dart';
import 'package:le_spawn/ui/widgets/game/video_game_list.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  void _onTapFilter() {
    print('Filter button tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Ta collection',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Grobold',
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: _onTapFilter,
              ),
            ],
          ),
          Expanded(
            child: VideoGameList(),
          ),
        ],
      ),
    );
  }
}
