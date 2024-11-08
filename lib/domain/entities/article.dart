import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;

  final String date;
  final String postModified;
  final String title;
  final String? image;
  final List<Map<String, dynamic>> detailedArticle;

  const Article({
    required this.id,
    required this.date,
    required this.postModified,
    required this.title,
    required this.image,
    required this.detailedArticle,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? 0,
      date: json['post_date_creation'] ?? '',
      postModified: json['post_date_modified'] ?? '',
      title: json['post_title'] ?? '',
      image: json['post_illustration_image'],
      detailedArticle:
          List<Map<String, dynamic>>.from(json['post_detailed'] ?? []),
    );
  }

  @override
  List<Object?> get props =>
      [id, date, postModified, title, image, detailedArticle];
}
