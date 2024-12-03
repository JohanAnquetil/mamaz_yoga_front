import 'package:dartz/dartz.dart';

abstract class ArticlesRepository {
  Future<Either> getArticles();
}
