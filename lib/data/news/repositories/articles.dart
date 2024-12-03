import 'package:mamaz_yoga/data/sources/auth_api_service.dart';
import 'package:mamaz_yoga/domain/articles/repositories/articles_remote_data_source.dart';
import 'package:mamaz_yoga/init_config.dart';
import 'package:dartz/dartz.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  @override
  Future<Either> getArticles() async {
    var articles = await getIt<AuthService>().getArticles();
    return articles.fold((error) => Left(error), (success) => Right(success));
  }
}
