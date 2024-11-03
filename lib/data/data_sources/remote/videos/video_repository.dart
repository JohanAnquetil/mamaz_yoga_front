import '../../../../domain/entities/category.dart';
import '../../../../domain/entities/video.dart';

abstract class VideoRepository {
  Future<List<Category>> getVideosCategories();
  Future<List<Video>> getVideosByCategory(String categoryName);

 // Future<String> streamVideoWithHeaders(String categoryName, String videoName);
}
