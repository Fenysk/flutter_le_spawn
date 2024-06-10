import 'package:le_spawn/models/video_game_item_content.dart';
import 'package:le_spawn/models/video_game.dart';
import 'package:le_spawn/data/video_game_data.dart';

class VideoGameItemModel {
  VideoGameItemModel({
    required this.id,
    required this.edition,
    required this.photos,
    this.note,
    this.purchasedPrice,
    this.estimatedPrice,
    this.negotiatedPrice,
    required this.currency,
    required this.state,
    required this.visibility,
    required this.region,
    required this.progression,
    required this.createdAt,
    required this.updatedAt,
    required this.videoGameId,
    required this.collectionId,
    this.Content,
  }) {
    VideoGame = videoGameData.firstWhere((game) => game.id == videoGameId);
  }

  final String id;
  final String edition;
  final List<String> photos;
  final String? note;
  final double? purchasedPrice;
  final double? estimatedPrice;
  final double? negotiatedPrice;
  final String currency;
  final String state;
  final String visibility;
  final String region;
  final String progression;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String videoGameId;
  final String collectionId;
  final List<VideoGameItemContentModel>? Content;
  late final VideoGameModel VideoGame;
}
