import 'package:dartz/dartz.dart';
import 'package:mamaz_yoga/data/sources/auth_api_service.dart';
import 'package:mamaz_yoga/domain/videos/entities/video.dart';
import 'package:mamaz_yoga/domain/videos/repositories/video_repository.dart';
import 'package:mamaz_yoga/init_config.dart';

class VideosRepositoryImpl extends VideoRepository {
  @override
  Future<Either> getListOfCategories() async {
    var category = await getIt<AuthService>().getListOfCategories();
    return category.fold((error) => Left(error), (success) => Right(success));
  }

  @override
  Future<VideoEntity> getVideoDetails(int id) {
    // TODO: implement getVideoDetails
    throw UnimplementedError();
  }

  @override
  Future<Either> getVideosByCategory(int id) async {
    var videos = await getIt<AuthService>().getVideosByCategory(id);
    return videos.fold((error) => Left(error), (success) => Right(success));
  }
}
