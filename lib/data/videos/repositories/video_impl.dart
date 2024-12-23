import 'package:dartz/dartz.dart';
import '../../sources/auth_api_service.dart';
import '../../../domain/videos/entities/video.dart';
import '../../../domain/videos/repositories/video_repository.dart';
import '../../../init_config.dart';

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
    print("videos in video repo : $videos");
    return videos.fold((error) => Left(error), (success) => Right(success));
  }

  @override
  Future<Either> streamVideoWithHeaders(int id) async {
    var videoStreaming = await getIt<AuthService>().streamVideoWithHeaders(id);
    return videoStreaming.fold(
        (error) => Left(error), (success) => Right(success));
  }

  @override
  Future<Either> fetchAllVideos() async {
    var allVideos = await getIt<AuthService>().fetchAllVideos();
    return allVideos.fold((error) => Left(error), (success) {
      print("success in fetching video : $success");
      return Right(success);
    });
  }

  @override
  Future<Either> getHistoricalVideos(int id) async {
    var allVideos = await getIt<AuthService>().fetchHistoricById(id);
    return allVideos.fold((error) => Left(error), (success) {
      print("success in fetching Historic video : $success");
      return Right(success);
    });
  }
}
