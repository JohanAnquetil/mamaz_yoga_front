import 'package:mamaz_yoga/domain/articles/entities/article.dart';

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
      id: json['id'],
      date: json['date'],
      postModified: json['postModified'],
      title: json['title'],
      image: json['image'],
      detailedArticle: json['detailedArticle'],
    );
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
