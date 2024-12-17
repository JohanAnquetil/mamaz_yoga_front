import 'package:dartz/dartz.dart';

import '../../entities/category.dart';
import '../entities/video.dart';

abstract class VideoRepository {
  Future<Either> getListOfCategories();
  Future<Either> getVideosByCategory(int id);
  Future<VideoEntity> getVideoDetails(int id);

  // Future<String> streamVideoWithHeaders(String categoryName, String videoName);
}
