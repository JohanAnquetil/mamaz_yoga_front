import 'package:dio/dio.dart';
import 'package:mamaz_yoga/data/data_sources/remote/articles/articles_remote_data_source.dart';
import 'package:mamaz_yoga/domain/entities/article.dart';
import '../../../../init_config.dart';

class ArticlesRemoteDataSourceImpl implements ArticlesRemoteDataSource {

  @override
  Future<List<Article>> getArticles() async {
    Dio dio = getIt<Dio>();
    try {
      // dio.options.headers['Authorization'] = 'Bearer $token';
      print('Envoi de la requête à l\'API...');
      final response = await dio.get('/posts/published');
      print('Réponse de l\'API : ${response.statusCode}');
      print('Données reçues : ${response.data}');
      var result = (response.data['posts'] as List)
          .map((e) => Article.fromJson(e))
          .toList();
      return result;
    } on DioException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}


