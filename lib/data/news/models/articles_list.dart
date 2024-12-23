import '../../../domain/articles/entities/article.dart';

class ArticleModel {
  final int id;

  final String date;
  final String postModified;
  final String title;
  final String? image;
  final List<Map<String, dynamic>> detailedArticle;

  const ArticleModel({
    required this.id,
    required this.date,
    required this.postModified,
    required this.title,
    required this.image,
    required this.detailedArticle,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        id: json['id'] ?? 0,
        date: json['post_date_creation'] ?? "",
        postModified: json['postModified'] ?? "",
        title: json['post_title'] ?? "",
        image: json['post_illustration_image'] ?? "",
        detailedArticle: List<Map<String, dynamic>>.from(
          json['post_detailed'] ?? [],
        ));
  }
}

extension ArticleModelXArticleEntity on ArticleModel {
  ArticleEntity toEntity() => ArticleEntity(
        id: id,
        date: date,
        postModified: postModified,
        title: title,
        image: image,
        detailedArticle: detailedArticle,
      );
}
