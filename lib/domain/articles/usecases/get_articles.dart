import 'package:dartz/dartz.dart';
import '../repositories/articles_remote_data_source.dart';
import '../../../init_config.dart';

class GetArticlesUseCase {
  Future<Either> call() async {
    return await getIt<ArticlesRepository>().getArticles();
  }
}

class GetArticleUseCase {
  Future<Either> call(int id) async {
    return await getIt<ArticlesRepository>().getArticle(id);
  }
}
