import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int id;

  final String date;
  final String postModified;
  final String title;
  final String? image;
  final List<Map<String, dynamic>> detailedArticle;

  const ArticleEntity({
    required this.id,
    required this.date,
    required this.postModified,
    required this.title,
    required this.image,
    required this.detailedArticle,
  });

  @override
  List<Object?> get props =>
      [id, date, postModified, title, image, detailedArticle];
}
