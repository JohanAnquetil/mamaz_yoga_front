// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mamaz_yoga/domain/videos/entities/video.dart';
// import 'package:mamaz_yoga/presentation/blocs/videos/videos_state.dart';

// import '../../../domain/videos/repositories/video_repository.dart';

// class VideoCubit extends Cubit<VideoState> {
//   final VideoRepository videoRepository;

//   VideoCubit(this.videoRepository) : super(VideoInitial());

//   Future<void> loadCategories() async {
//     try {
//       emit(VideoLoading());
//       final categories = await videoRepository.getVideosCategories();
//       emit(VideoCategoriesLoaded(categories));
//     } catch (e) {
//       emit(VideoError("Failed to load categories"));
//     }
//   }

//   Future<void> loadVideosByCategory(String categoryName) async {
//     try {
//       emit(VideoLoading());
//       final List<Video> videos =
//           await videoRepository.getVideosByCategory(categoryName);
//       emit(VideoLoaded(videos));
//     } catch (e) {
//       emit(VideoError("Failed to load videos"));
//     }
//   }
//   //
//   // Future<void> streamVideo(String categoryName, String videoName) async {
//   //   try {
//   //     emit(VideoLoading());
//   //
//   //     // Appeler la méthode du repository pour récupérer la vidéo avec les en-têtes
//   //     final video = await videoRepository.streamVideoWithHeaders(categoryName, videoName);
//   //
//   //     emit(VideoStreamLoaded(video));
//   //   } catch (e) {
//   //     emit(VideoError("Failed to load video"));
//   //   }
//   // }
// }
