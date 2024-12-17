import 'package:dartz/dartz.dart';
import 'package:mamaz_yoga/domain/videos/repositories/video_repository.dart';
import 'package:mamaz_yoga/init_config.dart';

class GetListOfCategoriesUsecase {
  Future<Either> call() async {
    return await getIt<VideoRepository>().getListOfCategories();
  }
}
