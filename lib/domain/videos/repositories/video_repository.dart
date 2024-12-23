import 'package:dartz/dartz.dart';

import '../entities/video.dart';

abstract class VideoRepository {
  Future<Either> getListOfCategories();
  Future<Either> getVideosByCategory(int id);
  Future<VideoEntity> getVideoDetails(int id);
  Future<Either> fetchAllVideos();
  Future<Either> streamVideoWithHeaders(int id);
  Future<Either> getHistoricalVideos(int id);
}
