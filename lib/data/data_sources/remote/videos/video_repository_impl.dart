import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../domain/entities/category.dart';
import '../../../../domain/entities/video.dart';
import 'video_repository.dart';
import '../../../../init_config.dart';

class VideoRepositoryImpl implements VideoRepository {
  //final Dio getIt<dio>;

  // VideoRepositoryImpl({required this.dio});
  @override
  Future<List<Category>> getVideosCategories() async {
    Dio dio = getIt<Dio>();
    try {
      final token = await const FlutterSecureStorage().read(key: 'token');

      final response = await dio.get(
        '/videos/categories',
        options: Options(
          method: 'GET',
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print(response);
      final List<dynamic> categoriesData = response.data;
      print(categoriesData);
      final filteredCategories = categoriesData
          .where((json) => json['name'] != 'PAS POUR APPLICATION')
          .toList();
      return filteredCategories.map((json) => Category.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching video categories: $e');
      throw Exception('Failed to load video categories');
    }
  }

  @override
  Future<List<Video>> getVideosByCategory(String categoryName) async {
    Dio dio = getIt<Dio>();
    final token = await const FlutterSecureStorage().read(key: 'token');
    final response = await dio.request(
      '/videos/categories/$categoryName',
      options: Options(
        method: 'GET',
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
    print('response from: getvideosbycategorie: $response');
    return (response.data['videos'] as List)
        .map((json) => Video.fromJson(json))
        .toList();
  }

  // @override
  // Future<Video> streamVideoWithHeaders(String categoryName, String videoName) async {
  //   Dio dio = getIt<Dio>();
  //   final token = await const FlutterSecureStorage().read(key: 'token');
  //   final response = await dio.get(
  //     '/videos/categories/$categoryName/$videoName',
  //     options: Options(
  //       method: 'GET',
  //       headers: {'Authorization': 'Bearer $token', "Range": "bytes=0-"},
  //     ),
  //   );
  //   print('response from: streamVideoWithHeaders: ${response}');
  //   return Video.fromJson(response.data['video']);
  // }

  // @override
  // Future<Video> streamVideoWithHeaders(String categoryName, String videoName) async {
  //   Dio dio = getIt<Dio>();
  //   final token = await const FlutterSecureStorage().read(key: 'token');
  //
  //   // L'appel API récupère la vidéo directement (stream vidéo)
  //   final response = await dio.get(
  //     '/videos/categories/$categoryName/$videoName',
  //     options: Options(
  //       method: 'GET',
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         "Range": "bytes=0-",  // Header pour le streaming progressif
  //       },
  //       responseType: ResponseType.bytes,  // Si le backend envoie directement un flux binaire
  //     ),
  //   );
  //
  //   print('Réponse du serveur pour la vidéo : ${response.statusCode}');
  //
  //   // Assurez-vous que vous renvoyez une URL vers la vidéo si nécessaire.
  //   // Vous pouvez renvoyer directement l'endpoint du backend ou gérer le flux directement.
  //   return response.realUri.toString();  // Retournez l'URL complète de la vidéo (depuis le backend)
  // }
}
