import 'package:dartz/dartz.dart';
import 'package:mamaz_yoga/core/usecase.dart';
import 'package:mamaz_yoga/domain/articles/repositories/articles_remote_data_source.dart';
import 'package:mamaz_yoga/init_config.dart';

class GetArticlesUseCase {
  @override
  Future<Either> call() async {
    return await getIt<ArticlesRepository>().getArticles();
  }
}
