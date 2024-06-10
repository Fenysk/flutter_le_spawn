class PlatformModel {
  final String id;
  final String name;
  final int generation;
  final List<String> altNames;
  final int releaseYear;
  final String manufacturer;
  final String logoSquare;
  final String logoTransparent;
  final List<String> pictures;
  final bool hasOnlineMultiplayer;
  final bool hasLocalMultiplayer;
  final String region;
  final List<String> gameSupportType;

  PlatformModel({
    required this.id,
    required this.name,
    required this.generation,
    required this.altNames,
    required this.releaseYear,
    required this.manufacturer,
    required this.logoSquare,
    required this.logoTransparent,
    required this.pictures,
    required this.hasOnlineMultiplayer,
    required this.hasLocalMultiplayer,
    required this.region,
    required this.gameSupportType,
  });
}
