import 'package:equatable/equatable.dart';
import 'package:mamaz_yoga/domain/videos/entities/category_video.dart';
import 'package:mamaz_yoga/domain/videos/entities/video.dart';

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
  //final List<VideoEntity>? listOfVideos;
  final String? error;

  const ListCategoriesVideosState({
    this.status = ListCategoriesStatus.initial,
    required this.getListOfCategories,
    this.videosByCategory = const {},
    this.error,
  });

  ListCategoriesVideosState copyWith({
    ListCategoriesStatus? status,
    List<CategoryVideoEntity>? getListOfCategories,
    //List<VideoEntity>? listOfVideos,
    Map<int, List<VideoEntity>>? videosByCategory,
    String? error,
  }) {
    return ListCategoriesVideosState(
        status: status ?? this.status,
        getListOfCategories: getListOfCategories ?? this.getListOfCategories,
        videosByCategory: videosByCategory ?? this.videosByCategory,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [
        status,
        getListOfCategories,
        error,
        videosByCategory,
      ];
}
