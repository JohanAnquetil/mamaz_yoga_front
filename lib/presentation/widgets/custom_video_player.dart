import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String? videoUrl;
  final bool isYoutubeVideo;

  const CustomVideoPlayer({
    super.key,
    this.videoUrl,
    required this.isYoutubeVideo,
  });

  @override
  CustomVideoPlayerState createState() => CustomVideoPlayerState();
}

class CustomVideoPlayerState extends State<CustomVideoPlayer> {
  YoutubePlayerController? _youtubeController;
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();

    if (widget.isYoutubeVideo) {
      _youtubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl!)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    } else {
      _videoPlayerController = VideoPlayerController.asset(widget.videoUrl!)
        ..initialize().then((_) {
          setState(() {}); // Rebuild to show the video when initialized
        });
    }
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: _videoPlayerController!.value.aspectRatio,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: <Widget>[
//           VideoPlayer(_videoPlayerController!),
//           _ControlsOverlay(controller: _videoPlayerController!),
//           VideoProgressIndicator(
//             _videoPlayerController!,
//             allowScrubbing: true,
//           ),
//         ],
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return widget.isYoutubeVideo
        ? YoutubePlayer(
            controller: _youtubeController!,
            showVideoProgressIndicator: true,
          )
        : _videoPlayerController != null &&
                _videoPlayerController!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_videoPlayerController!),
                    _ControlsOverlay(controller: _videoPlayerController!),
                    VideoProgressIndicator(
                      _videoPlayerController!,
                      allowScrubbing: true,
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
  }
}

class _ControlsOverlay extends StatefulWidget {
  final VideoPlayerController controller;

  const _ControlsOverlay({required this.controller});

  @override
  State<_ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<_ControlsOverlay> {
  bool _visible = true;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _startHideTimer();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _visible = false;
      });
    });
  }

  void _onTap() {
    setState(() {
      _visible = !_visible;
    });

    if (_visible) {
      _startHideTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              iconSize: 50.0,
              icon: Center(
                child: widget.controller.value.isPlaying
                    ? const Icon(Icons.pause, color: Colors.white)
                    : const Icon(Icons.play_arrow, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  widget.controller.value.isPlaying
                      ? widget.controller.pause()
                      : widget.controller.play();
                  _startHideTimer(); // Restart the timer when user interacts
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }
}
