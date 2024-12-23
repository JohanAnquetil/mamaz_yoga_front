import 'package:dartz/dartz.dart';
import '../repositories/video_repository.dart';
import '../../../init_config.dart';

class GetListOfCategoriesUsecase {
  Future<Either> call() async {
    return await getIt<VideoRepository>().getListOfCategories();
  }
}
