import 'package:dartz/dartz.dart';
import 'package:mamaz_yoga/domain/videos/repositories/video_repository.dart';
import 'package:mamaz_yoga/init_config.dart';

class GetVideoFromACategoryUsecase {
  Future<Either> call(int id) async {
    return await getIt<VideoRepository>().getVideosByCategory(id);
  }
}
