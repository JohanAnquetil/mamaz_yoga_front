// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:mamaz_yoga/domain/videos/entities/video.dart';

// import '../../../../domain/entities/category.dart';
// import '../../../../data/videos/models/video.dart';
// import '../../../../domain/videos/repositories/video_repository.dart';
// import '../../../../init_config.dart';

// class VideoRepositoryImpl implements VideoRepository {
//   //final Dio getIt<dio>;

//   // VideoRepositoryImpl({required this.dio});
//   @override
//   Future<List<Category>> getVideosCategories() async {
//     Dio dio = getIt<Dio>();
//     try {
//       final token = await const FlutterSecureStorage().read(key: 'token');

//       final response = await dio.get(
//         '/videos/categories',
//         options: Options(
//           method: 'GET',
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       print(response);
//       final List<dynamic> categoriesData = response.data;
//       print(categoriesData);
//       final filteredCategories = categoriesData
//           .where((json) => json['name'] != 'PAS POUR APPLICATION')
//           .toList();
//       return filteredCategories.map((json) => Category.fromJson(json)).toList();
//     } catch (e) {
//       print('Error fetching video categories: $e');
//       throw Exception('Failed to load video categories');
//     }
//   }

//   @override
//   Future<List<VideoEntity>> getVideosByCategory(String categoryName) async {
//     Dio dio = getIt<Dio>();
//     final token = await const FlutterSecureStorage().read(key: 'token');
//     final response = await dio.request(
//       '/videos/categories/$categoryName',
//       options: Options(
//         method: 'GET',
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       ),
//     );
//     print('response from: getvideosbycategorie: $response');
//     return (response.data['videos'] as List)
//         .map((json) => VideoModel.fromJson(json).toEntity())
//         .toList();
//   }
// }
