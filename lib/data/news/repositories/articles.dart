import '../../sources/auth_api_service.dart';
import '../../../domain/articles/repositories/articles_remote_data_source.dart';
import '../../../init_config.dart';
import 'package:dartz/dartz.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  @override
  Future<Either> getArticles() async {
    var articles = await getIt<AuthService>().getArticles();
    return articles.fold((error) => Left(error), (success) => Right(success));
  }

  @override
  Future<Either> getArticle(int id) async {
    var article = await getIt<AuthService>().getArticle(id);
    return article.fold((error) => Left(error), (success) => Right(success));
  }
}
