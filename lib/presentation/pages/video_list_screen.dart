import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/presentation/pages/video_player_screen.dart';

import '../../init_config.dart';
import '../blocs/videos/videos_cubit.dart';
import '../blocs/videos/videos_state.dart';
import '../widgets/custom_app_bar.dart';

@RoutePage()
class VideoListPage extends StatelessWidget {
  final String categoryName;

  const VideoListPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           getIt<VideoCubit>()..loadVideosByCategory(categoryName),
//       child: Scaffold(
//         appBar: CustomAppBar(
//           title: '$categoryName Videos',
//           leading: false,
//         ),
//         body: BlocBuilder<VideoCubit, VideoState>(
//           builder: (context, state) {
//             if (state is VideoLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is VideoLoaded) {
//               return ListView.builder(
//                 itemCount: state.videos.length,
//                 itemBuilder: (context, index) {
//                   final video = state.videos[index];
//                   return ListTile(
//                     title: Text(video.name),
//                     subtitle: Text(video.formattedDuration),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BlocProvider(
//                             create: (context) => getIt<VideoCubit>(),
//                             child: VideoPlayerPage(
//                               categoryName: categoryName,
//                               videoName: video.name,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             } else if (state is VideoError) {
//               return Center(child: Text(state.message));
//             }

//             return const Center(child: Text('No videos available'));
//           },
//         ),
//       ),
//     );
//   }
// }
