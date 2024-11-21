import 'package:mamaz_yoga/domain/videos/entities/video.dart';

class VideoModel {
  final String name;
  final String category;
  final String formattedDuration;

  VideoModel({
    required this.name,
    required this.category,
    required this.formattedDuration,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      name: json['name'],
      category: json['category'],
      formattedDuration: json['formattedDuration'],
    );
  }
}

extension VideoXModel on VideoModel {
  VideoEntity toEntity() {
    return VideoEntity(
      name: name,
      category: category,
      formattedDuration: formattedDuration,
    );
  }
}
