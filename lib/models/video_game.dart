import 'package:le_spawn/models/platforms.dart';
import 'package:le_spawn/data/platform_data.dart';

class VideoGameModel {
  VideoGameModel({
    required this.id,
    required this.title,
    this.description,
    required this.genres,
    required this.images,
    required this.releaseYear,
    this.editor,
    this.publisher,
    this.developer,
    required this.maxLocalMultiplayer,
    required this.maxOnlineMultiplayer,
    required this.platformId,
  }) {
    Platform = platformData.firstWhere((platform) => platform.id == platformId);
  }

  final String id;
  final String title;
  final String? description;
  final List<String> genres;
  final List<String> images;
  final int releaseYear;
  final String? editor;
  final String? publisher;
  final String? developer;
  final int maxLocalMultiplayer;
  final int maxOnlineMultiplayer;
  final String platformId;
  late final PlatformModel Platform;
}
