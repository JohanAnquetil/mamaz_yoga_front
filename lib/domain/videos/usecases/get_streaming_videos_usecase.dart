import 'package:dartz/dartz.dart';
import '../repositories/video_repository.dart';
import '../../../init_config.dart';

class GetVideoStreamingUsecase {
  Future<Either> call(int id) async {
    return await getIt<VideoRepository>().streamVideoWithHeaders(id);
  }
}
