class VideoGame {
  VideoGame({
    required this.title,
    required this.edition,
    required this.region,
    required this.mainPhoto,
    required this.platform,
    this.description,
    this.initialPurchasePrice,
    this.negotiatedPrice,
    this.currentMarketValue,
  });

  final String title;
  final String? description;
  final String edition;
  final String region;
  final String platform;
  final String mainPhoto;
  final double? initialPurchasePrice;
  final double? negotiatedPrice;
  final double? currentMarketValue;
}
