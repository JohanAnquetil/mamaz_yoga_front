import 'package:mamaz_yoga/domain/entities/article.dart';

abstract class ArticlesRemoteDataSource  {
  Future<List<Article>> getArticles();
}