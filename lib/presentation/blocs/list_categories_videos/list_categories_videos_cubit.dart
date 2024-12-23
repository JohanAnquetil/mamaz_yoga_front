import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/videos/models/video.dart';
import '../../../data/videos/models/video_category.dart';
import '../../../domain/videos/entities/category_video.dart';
import '../../../domain/videos/entities/video.dart';
import '../../../domain/videos/usecases/get_all_videos.dart';
import '../../../domain/videos/usecases/get_historic.dart';
import '../../../domain/videos/usecases/get_list_of_categories_usecase.dart';
import '../../../domain/videos/usecases/get_streaming_videos_usecase.dart';
import '../../../domain/videos/usecases/get_videos_from_a_category_usecase.dart';
import 'list_categories_videos_state.dart';

class ListCategoriesVideosCubit extends Cubit<ListCategoriesVideosState> {
  ListCategoriesVideosCubit()
      : super(
          ListCategoriesVideosState(
            status: ListCategoriesStatus.initial,
            getListOfCategories: [],
            listOfVideos: [],
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

  Future<void> fetchHistoricalVideos(int id) async {
    print("=== Début fetchHistoricalVideos ===");
    emit(state.copyWith(status: ListCategoriesStatus.loading));
    try {
      print("Appel du usecase avec id: $id");
      final videos = await GetHistoricByIdUsecase().call(id);
      print("Réponse du usecase: $videos");
      videos.fold(
          (fail) => {
                print("Error fetching historic ${id} : $fail"),
                emit(state.copyWith(
                    status: ListCategoriesStatus.failure, error: fail))
              }, (fetchSuccessed) {
        print("fetchSuccessed in historic: $fetchSuccessed");
        print(
            "Type of fetchSuccessed in historic: ${fetchSuccessed.runtimeType}");

        fetchSuccessed.forEach((element) {
          print(
              "Element type in historic: ${element.runtimeType}, value: $element");
        });

        // Filtrer uniquement les Map<String, dynamic>
        final filteredSuccess =
            fetchSuccessed.whereType<Map<String, dynamic>>().toList();
        print("Filtered success data in historic: $filteredSuccess");
        print(
            "Type of filteredSuccess in historic: ${filteredSuccess.runtimeType}");

        // Transformation explicite en List<VideoEntity>
        var videosList = filteredSuccess
            .map((json) {
              try {
                print("Mapping JSON in historic: ${json['video_entity']}");
                return VideoModel.fromJson(json['video_entity']).toEntity();
              } catch (e) {
                print("Error during mapping of JSON in historic: $json");
                print("Exception: $e");
                rethrow; // Pour capturer les erreurs spécifiques au mapping
              }
            })
            .toList()
            .cast<VideoEntity>();
        ;

        var videolistToList = videosList.toList();
        print("videosList in historic: $videosList");
        print("Mapped videos in historic: $videolistToList");
        print("Type of videosList: ${videolistToList.runtimeType}");

        // Mise à jour de l'état

        emit(state.copyWith(
            status: ListCategoriesStatus.success,
            historicalVideos: videolistToList));
        try {} catch (e) {
          print("Error in fetchHistoricalVideos in historic: $e");
        }
      });
    } catch (error) {
      emit(state.copyWith(
          status: ListCategoriesStatus.failure, error: error.toString()));
    }
  }

  Future<void> fetchAllVideos() async {
    print("fetchAllVideos called");
    emit(state.copyWith(status: ListCategoriesStatus.loading));

    try {
      // Appel au usecase
      final videos = await GetAllVideosUsecase().call();

      // Traitement des résultats
      videos.fold(
        (failure) {
          print("Failure: $failure");
          emit(state.copyWith(status: ListCategoriesStatus.failure));
        },
        (success) {
          try {
            print("Raw success data: $success");
            print("Type of success: ${success.runtimeType}");

            // Logs détaillés pour chaque élément de success
            success.forEach((element) {
              print("Element type: ${element.runtimeType}, value: $element");
            });

            // Filtrer uniquement les Map<String, dynamic>
            final filteredSuccess =
                success.whereType<Map<String, dynamic>>().toList();
            print("Filtered success data: $filteredSuccess");
            print("Type of filteredSuccess: ${filteredSuccess.runtimeType}");

            // Transformation explicite en List<VideoEntity>
            var videosList = filteredSuccess.map((json) {
              try {
                print("Mapping JSON: $json");
                return VideoModel.fromJson(json).toEntity();
              } catch (e) {
                print("Error during mapping of JSON: $json");
                print("Exception: $e");
                rethrow; // Pour capturer les erreurs spécifiques au mapping
              }
            });

            var videolistToList = videosList.toList();
            print("videosList: $videosList");
            print("Mapped videos: $videolistToList");
            print("Type of videosList: ${videolistToList.runtimeType}");

            // Mise à jour de l'état
            emit(state.copyWith(
              status: ListCategoriesStatus.success,
              listOfVideos: videolistToList,
            ));
            print("State successfully updated with videosList");
          } catch (e, stackTrace) {
            print("Error during mapping or toList: $e");
            print(stackTrace);
            emit(state.copyWith(
              status: ListCategoriesStatus.failure,
              error: "Error during mapping or toList: $e",
            ));
          }
        },
      );
    } catch (e, stackTrace) {
      print("Error in fetchAllVideos: $e");
      print(stackTrace);
      emit(state.copyWith(
        status: ListCategoriesStatus.failure,
        error: e.toString(),
      ));
    }
  }

  // Future<void> fetchAllVideos() async {
  //   print("fetchAllVideos called");
  //   emit(state.copyWith(status: ListCategoriesStatus.loading));
  //   try {
  //     final videos = await GetAllVideosUsecase().call();
  //     videos.fold(
  //         (failure) =>
  //             emit(state.copyWith(status: ListCategoriesStatus.failure)),
  //         (success) {
  //       List<VideoEntity> videosList = success;
  //       print("success in cubit videos: $videosList");
  //       print("Type of success: ${videosList.runtimeType}");
  //       emit(state.copyWith(
  //           status: ListCategoriesStatus.success, listOfVideos: videosList));
  //     });
  //   } catch (error) {
  //     emit(state.copyWith(
  //         status: ListCategoriesStatus.failure, error: error.toString()));
  //   }
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

    Future<void> streamVideo(int idVideo) async {
      try {
        emit(state.copyWith(status: ListCategoriesStatus.loading));

        // Appeler la méthode du repository pour récupérer la vidéo avec les en-têtes
        final video = await GetVideoStreamingUsecase().call(idVideo);
        video.fold(
            (fail) => {
                  print("Error fetching videos for category ${idVideo}"),
                },
            (success) {});
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
}
