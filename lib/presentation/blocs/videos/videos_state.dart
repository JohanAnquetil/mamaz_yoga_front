// import 'package:equatable/equatable.dart';

// import '../../../domain/entities/category.dart';
// import '../../../domain/videos/entities/video.dart';

// enum VideoStreamingStatus {
//   initial,
//   loading,
//   success,
//   failure,
// }

// extension VideoStreamingStatusX on VideoStreamingStatus {
//   bool get isInitial => this == VideoStreamingStatus.initial;
//   bool get isLoading => this == VideoStreamingStatus.loading;
//   bool get isSuccess => this == VideoStreamingStatus.success;
//   bool get isFailure => this == VideoStreamingStatus.failure;
// }

// class VideoStreamingState extends Equatable {
//   final VideoEntity video;
//   final VideoStreamingStatus status;
//   final 

//   const

//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }

// abstract class VideoState {}

// class VideoInitial extends VideoState {}

// class VideoLoading extends VideoState {}

// class VideoCategoriesLoaded extends VideoState {
//   final List<Category> categories;

//   VideoCategoriesLoaded(this.categories);
// }

// class VideoLoaded extends VideoState {
//   final List<Video> videos;

//   VideoLoaded(this.videos);
// }

// class VideoStreamLoaded extends VideoState {
//   final Video video;

//   VideoStreamLoaded(this.video);

//   // @override
//   // List<Object> get props => [video];
// }

// class VideoError extends VideoState {
//   final String message;

//   VideoError(this.message);
// }
