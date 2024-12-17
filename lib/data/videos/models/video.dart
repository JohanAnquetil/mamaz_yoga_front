import 'package:mamaz_yoga/domain/videos/entities/video.dart';

class VideoModel {
  final int id;
  final String? name;
  final String? path;
  final bool isFreeVideo;
  final String? thumbnail;
  final DateTime? date;
  final int lenght;

  const VideoModel({
    required this.id,
    this.name,
    this.path,
    required this.isFreeVideo,
    this.thumbnail,
    this.date,
    required this.lenght,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? 0,
      name: json['name'] as String?,
      path: json['path'] as String?,
      isFreeVideo: json['isFreeVideo'] == 1 ? true : false,
      thumbnail: json['thumbnail'] as String?,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      lenght: json['lenght'] ?? 0,
    );
  }
}

extension VideoXModel on VideoModel {
  VideoEntity toEntity() {
    return VideoEntity(
      id: id,
      name: name ?? "",
      path: path ?? "",
      isFreeVideo: isFreeVideo,
      thumbnail: thumbnail ?? "",
      date: date ?? DateTime.now(),
      lenght: lenght,
    );
  }
}
