import '../../entities/category.dart';
import '../entities/video.dart';

abstract class VideoRepository {
  Future<List<Category>> getVideosCategories();
  Future<List<VideoEntity>> getVideosByCategory(String categoryName);

  // Future<String> streamVideoWithHeaders(String categoryName, String videoName);
}
