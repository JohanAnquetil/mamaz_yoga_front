import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/data/videos/models/video.dart';
import 'package:mamaz_yoga/data/videos/models/video_category.dart';
import 'package:mamaz_yoga/domain/videos/entities/category_video.dart';
import 'package:mamaz_yoga/domain/videos/entities/video.dart';
import 'package:mamaz_yoga/domain/videos/usecases/get_list_of_categories_usecase.dart';
import 'package:mamaz_yoga/domain/videos/usecases/get_videos_from_a_category_usecase.dart';
import 'package:mamaz_yoga/presentation/blocs/list_categories_videos/list_categories_videos_state.dart';

class ListCategoriesVideosCubit extends Cubit<ListCategoriesVideosState> {
  ListCategoriesVideosCubit()
      : super(
          ListCategoriesVideosState(
            status: ListCategoriesStatus.initial,
            getListOfCategories: [],
          ),
        );
  // Future<void> fetchListOfCategories() async {
  // emit(state.copyWith(status: ListCategoriesStatus.loading));
  // try {
  //   final categories = await GetListOfCategoriesUsecase().call();
  //   categories.fold(
  //     (failures) => {
  //       print("failure"),
  //       emit(state.copyWith(
  //           status: ListCategoriesStatus.failure, error: failures))
  //     },
  //     (fetchSuccessed) {
  //       print("fetchSuccessed: $fetchSuccessed");
  //       print("Type of fetchSuccessed: ${fetchSuccessed.runtimeType}");
  //       final List<Map<String, dynamic>> jsonList =
  //           fetchSuccessed.cast<Map<String, dynamic>>();
  //       print(jsonList);
  //       final mappedCategories = jsonList
  //           .map((json) =>
  //               CategoryVideoModel.fromJson(json).categoryToEntity())
  //           .toList();

  //              Map<int, List<VideoEntity>> videosMap = {};

  //     // Charger les vidéos pour chaque catégorie
  //     for (var category in categoryList) {
  //       final videos = await GetVideoFromACategoryUsecase().call(category.id);
  //       videos.fold(
  //         (fail) => print("Error fetching videos for category ${category.id}"),
  //         (videoList) => videosMap[category.id] = videoList,
  //       );
  //     }

  //     emit(state.copyWith(
  //       status: ListCategoriesStatus.success,
  //       getListOfCategories: categoryList,
  //       videosByCategory: videosMap,
  //     ));
  //   },
  // );
  // } catch (error) {
  //   emit(state.copyWith(
  //       status: ListCategoriesStatus.failure, error: error.toString()));
  // }

  Future<void> fetchListOfCategories() async {
    emit(state.copyWith(status: ListCategoriesStatus.loading));

    try {
      final categories = await GetListOfCategoriesUsecase().call();

      categories.fold(
        (failures) => emit(state.copyWith(
            status: ListCategoriesStatus.failure, error: failures.toString())),
        (fetchSuccessed) async {
          print("fetchSuccessed: $fetchSuccessed");
          print("Type of fetchSuccessed: ${fetchSuccessed.runtimeType}");

          if (fetchSuccessed is List) {
            final jsonList =
                fetchSuccessed.whereType<Map<String, dynamic>>().toList();

            // Mapper les catégories
            final mappedCategories = jsonList
                .map((json) =>
                    CategoryVideoModel.fromJson(json).categoryToEntity())
                .toList();

            Map<int, List<VideoEntity>> videosMap = {};

            // Charger les vidéos pour chaque catégorie
            for (var category in mappedCategories) {
              final videos =
                  await GetVideoFromACategoryUsecase().call(category.id);

              videos.fold(
                (fail) =>
                    print("Error fetching videos for category ${category.id}"),
                (videoData) {
                  if (videoData is List) {
                    videosMap[category.id] = videoData
                        .whereType<Map<String, dynamic>>()
                        .map((json) => VideoModel.fromJson(json).toEntity())
                        .toList();
                  } else if (videoData is Map<String, dynamic>) {
                    // Si videoData est une Map unique
                    videosMap[category.id] = [
                      VideoModel.fromJson(videoData).toEntity()
                    ];
                  } else {
                    print(
                        "Unexpected type for videoData: ${videoData.runtimeType}");
                  }
                },
              );
            }

            emit(state.copyWith(
              status: ListCategoriesStatus.success,
              getListOfCategories: mappedCategories,
              videosByCategory: videosMap,
            ));
          } else {
            emit(state.copyWith(
                status: ListCategoriesStatus.failure,
                error: "Invalid data format for categories"));
          }
        },
      );
    } catch (error) {
      emit(state.copyWith(
          status: ListCategoriesStatus.failure, error: error.toString()));
    }
  }

  // Future<void> fetchVideosFromACategory(int id) async {
  //   emit(state.copyWith(status: ListCategoriesStatus.loading));
  //   try {
  //     final videos = await GetVideoFromACategoryUsecase().call(id);
  //     videos.fold(
  //         (fail) => {
  //               emit(state.copyWith(
  //                   status: ListCategoriesStatus.failure, error: fail))
  //             }, (fetchSuccessed) {
  //       print("fetchSuccessed: $fetchSuccessed");
  //       print("Type of fetchSuccessed: ${fetchSuccessed.runtimeType}");
  //     });
  //   } catch (error) {
  //     emit(state.copyWith(
  //         status: ListCategoriesStatus.failure, error: error.toString()));
  //   }
  // }
// }
}
