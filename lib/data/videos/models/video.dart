import '../../../domain/videos/entities/video.dart';

class VideoModel {
  final int id;
  final String? name;
  final String? path;
  final bool isFreeVideo;
  final String? thumbnail;
  final DateTime? date;
  final int lenght;
  final int? categoryId;
  final String? category;

  const VideoModel({
    required this.id,
    this.name,
    this.path,
    required this.isFreeVideo,
    this.thumbnail,
    this.date,
    required this.lenght,
    this.categoryId,
    this.category,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    print("Mapping JSON to VideoModel: $json");
    try {
      return VideoModel(
          id: json['id'] ?? 0,
          name: json['name'] as String?,
          path: json['path'] as String?,
          isFreeVideo: json['isFreeVideo'] == 1 ? true : false,
          thumbnail: json['thumbnail'] as String?,
          date: json['date'] != null ? DateTime.parse(json['date']) : null,
          lenght: json['lenght'] ?? 0,
          categoryId: json['categoryId'] ?? 0,
          category: json['categoryName'] ?? "Catégorie inconnue");
    } catch (e) {
      print("Error in fromJson: $e, JSON: $json");
      rethrow;
    }
  }

  @override
  String toString() {
    return 'VideoModel(id: $id, name: $name, path: $path, isFreeVideo: $isFreeVideo, thumbnail: $thumbnail, date: $date, lenght: $lenght, categoryId: $categoryId, category: $category)';
  }
}

extension VideoXModel on VideoModel {
  VideoEntity toEntity() {
    print("Converting VideoModel to VideoEntity: $this");
    try {
      return VideoEntity(
        id: id,
        name: name ?? "",
        path: path ?? "",
        isFreeVideo: isFreeVideo,
        thumbnail: thumbnail ?? "",
        date: date ?? DateTime.now(),
        lenght: lenght ?? 0,
        categoryId: categoryId ?? 0,
        category: category ?? "",
      );
    } catch (e) {
      print("Error in toEntity: $e, VideoModel: $this");
      rethrow;
    }
  }
}
