import 'package:dartz/dartz.dart';

abstract class ArticlesRepository {
  Future<Either> getArticles();
  Future<Either> getArticle(int id);
}
