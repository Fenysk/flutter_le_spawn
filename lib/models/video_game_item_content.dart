class VideoGameItemContentModel {
  VideoGameItemContentModel({
    required this.name,
    required this.photos,
    this.note,
    required this.state,
  });

  final String name;
  final List<String> photos;
  final String? note;
  final String state;
}
