import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final int id;
  final String name;
  final String path;
  final bool isFreeVideo;
  final String thumbnail;
  final DateTime date;
  final int lenght;
  final int categoryId;
  final String category;

  const VideoEntity(
      {required this.id,
      required this.name,
      required this.path,
      required this.isFreeVideo,
      required this.thumbnail,
      required this.date,
      required this.lenght,
      required this.categoryId,
      required this.category});

  static VideoEntity emptyVideo() => VideoEntity(
        id: 0,
        name: '',
        path: '',
        isFreeVideo: false,
        thumbnail: '',
        date: DateTime(1970, 1, 1),
        lenght: 0,
        categoryId: 0,
        category: '',
      );

  @override
  String toString() =>
      'VideoEntity(id: $id, name: $name, date: $date, path: $path, isFreeVideo: $isFreeVideo, thumbnail: $thumbnail, date: $date, lenght: $lenght, categoryId: $categoryId, category: $category,)';

  @override
  List<Object?> get props => [
        id,
        name,
        path,
        isFreeVideo,
        thumbnail,
        date,
        lenght,
        categoryId,
        category
      ];
}
