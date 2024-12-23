import 'package:equatable/equatable.dart';
import '../../../domain/videos/entities/category_video.dart';
import '../../../domain/videos/entities/video.dart';

enum ListCategoriesStatus { initial, loading, success, failure }

extension ListCategoriesStatusX on ListCategoriesStatus {
  bool get isInitial => this == ListCategoriesStatus.initial;
  bool get isLoading => this == ListCategoriesStatus.loading;
  bool get isSuccess => this == ListCategoriesStatus.success;
  bool get isFailure => this == ListCategoriesStatus.failure;
}

class ListCategoriesVideosState extends Equatable {
  final List<CategoryVideoEntity> getListOfCategories;
  final ListCategoriesStatus status;
  final Map<int, List<VideoEntity>> videosByCategory;
  final List<dynamic> listOfVideos;
  final List<VideoEntity> historicalVideos;
  final int videoId;
  final String? error;
  const ListCategoriesVideosState({
    this.status = ListCategoriesStatus.initial,
    required this.getListOfCategories,
    this.videosByCategory = const {},
    this.error,
    this.videoId = 0,
    this.historicalVideos = const [],
    required this.listOfVideos,
  });

  ListCategoriesVideosState copyWith({
    ListCategoriesStatus? status,
    List<CategoryVideoEntity>? getListOfCategories,
    Map<int, List<VideoEntity>>? videosByCategory,
    int? videoId,
    String? error,
    List<dynamic>? listOfVideos,
    List<VideoEntity>? historicalVideos,
    Map<int, int>? watchedVideoIds,
  }) {
    return ListCategoriesVideosState(
      status: status ?? this.status,
      getListOfCategories: getListOfCategories ?? this.getListOfCategories,
      videosByCategory: videosByCategory ?? this.videosByCategory,
      videoId: videoId ?? this.videoId,
      error: error ?? this.error,
      listOfVideos: listOfVideos ?? this.listOfVideos,
      historicalVideos: historicalVideos ?? this.historicalVideos,
    );
  }

  @override
  List<Object?> get props => [
        status,
        videoId,
        getListOfCategories,
        error,
        videosByCategory,
        listOfVideos,
        historicalVideos,
      ];
}
