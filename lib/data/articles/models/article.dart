import '../../../domain/articles/entities/detailed_article.dart';

class ArticleDetailedModel {
  final int id;

  final String date;
  final String postModified;
  final String title;
  final String? image;
  final List<Map<String, dynamic>> detailedArticle;

  const ArticleDetailedModel({
    required this.id,
    required this.date,
    required this.postModified,
    required this.title,
    required this.image,
    required this.detailedArticle,
  });

  factory ArticleDetailedModel.fromJson(Map<String, dynamic> json) {
    return ArticleDetailedModel(
      id: json['id'] ?? 0,
      date: json['date_creation'] ?? '',
      postModified: json['date_modified'] ?? '',
      title: json['title'] ?? '',
      image: json['illustration_image'],
      detailedArticle:
          List<Map<String, dynamic>>.from(json['post_content'] ?? []),
    );
  }
}

extension ArticleXEntity on ArticleDetailedModel {
  DetailedArticleEntitiy toEntity() => DetailedArticleEntitiy(
        id: id,
        date: date,
        postModified: postModified,
        title: title,
        image: image,
        detailedArticle: detailedArticle,
      );
}
