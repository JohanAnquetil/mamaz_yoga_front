import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VideoPlayerPage extends StatefulWidget {
  final String categoryName;
  final String videoName;

  const VideoPlayerPage(
      {super.key, required this.categoryName, required this.videoName});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  // VideoPlayerController? _videoPlayerController;
  // bool isLoading = true;
  // bool isFullScreen = false;
  // String? token;
  // final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// TODO MOVE IT
  // get baseUrl => null;

  @override
  void initState() {
    super.initState();
    // _initializeTokenAndLoadVideo();
  }

  @override
  Widget build(BuildContext context) => const Text('video_player');
}

  // Future<void> _initializeTokenAndLoadVideo() async {
  //   final String? storedToken = await _secureStorage.read(key: 'token');
  //   if (storedToken != null) {
  //     setState(() {
  //       token = storedToken;
  //     });
  //     _loadVideo();
  //   } else {
  //     print('Token not found');
  //   }
  // }

  // void _onTap() {
  //   setState(() {
  //     if (_videoPlayerController!.value.isPlaying) {
  //       _videoPlayerController!.pause();
  //     } else {
  //       _videoPlayerController!.play();
  //     }
  //   });
  // }

  // void _onDoubleTap() {
  //   if (isFullScreen) {
  //     _exitFullScreen();
  //   } else {
  //     _enterFullScreen();
  //   }
  // }

  // Future<void> _loadVideo() async {
  //   String videoUrl =
  //       '$baseUrl/videos/categories/${widget.categoryName}/${widget.videoName}';

  //   setState(() {
  //     _videoPlayerController = VideoPlayerController.network(videoUrl,
  //         httpHeaders: {'Authorization': 'Bearer $token', 'Range': 'bytes=0-'})
  //       ..initialize().then((_) {
  //         setState(() {
  //           isLoading = false;
  //           _videoPlayerController!.play();
  //         });
  //       });
  //   });
  // }

  // void _enterFullScreen() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //   SystemChrome.setPreferredOrientations(
  //       [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //   setState(() {
  //     isFullScreen = true;
  //   });
  // }

  // void _exitFullScreen() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //   SystemChrome.setPreferredOrientations(
  //       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //   setState(() {
  //     isFullScreen = false;
  //   });
  // }

  // @override
  // void dispose() {
  //   _videoPlayerController?.dispose();
  //   super.dispose();
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: isFullScreen
//           ? null
//           : CustomAppBar(
//               title: widget.videoName,
//               leading: false,
//             ),
//       body: Center(
//         child: isLoading
//             ? const CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: FittedBox(
//                       fit: BoxFit.contain,
//                       child: SizedBox(
//                         width: _videoPlayerController!.value.size.width,
//                         height: _videoPlayerController!.value.size.height,
//                         child: GestureDetector(
//                           onTap: _onTap,
//                           onDoubleTap: _onDoubleTap,
//                           child: VideoPlayer(_videoPlayerController!),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: VideoProgressIndicator(
//                       _videoPlayerController!,
//                       allowScrubbing: true,
//                       colors: const VideoProgressColors(
//                         playedColor: Colors.red,
//                         backgroundColor: Colors.white,
//                         bufferedColor: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
