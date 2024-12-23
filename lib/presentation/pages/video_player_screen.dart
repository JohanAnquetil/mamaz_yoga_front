import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mamaz_yoga/presentation/utils/get_token.dart';
import '../../core/constants/api_url.dart';
import '../../domain/videos/entities/video.dart';
import 'package:better_player/better_player.dart';
import '../blocs/list_categories_videos/list_categories_videos_cubit.dart';
import '../blocs/list_categories_videos/list_categories_videos_state.dart';
import '../routes/routes.gr.dart';

import '../widgets/custom_app_bar.dart';

@RoutePage()
class VideoPlayerPage extends StatefulWidget {
  final VideoEntity video;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final Dio dio = Dio();
  VideoPlayerPage({super.key, required this.video});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  BetterPlayerController? _controller;
  bool _isVideoRecorded = false;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<BetterPlayerController> _initializePlayer(
    String videoUrl,
    String token,
    BuildContext context,
  ) async {
    try {
      // 1. Enregistrement léger dans la BDD
      if (!_isVideoRecorded) {
        final userId = JwtDecoder.decode(token)['id'];
        final response = await widget.dio.post(
          "${ApiUrl.baseUrl}${ApiUrl.recordVideo}",
          data: {
            "userId": userId,
            "videoId": widget.video.id,
            "date": DateTime.now().toIso8601String(),
            "viewingTime": 19
          },
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
            // Optimisations Dio
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        );

        if (response.statusCode == 201) {
          _isVideoRecorded = true;
          context
              .read<ListCategoriesVideosCubit>()
              .fetchHistoricalVideos(userId);
        }
      }

      // 2. Configuration optimisée du player
      _controller?.dispose();

      _controller = BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          autoPlay: true,
          fit: BoxFit.contain,
          handleLifecycle: true,
          // Supprimer la configuration de buffering non supportée
        ),
      );

      await _controller!.setupDataSource(
        BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          videoUrl,
          headers: {'Authorization': 'Bearer $token'},
          cacheConfiguration: BetterPlayerCacheConfiguration(
            useCache: true,
            maxCacheFileSize: 10 * 1024 * 1024, // 10MB max par fichier
          ),
        ),
      );

      return _controller!;
    } catch (e) {
      print("Erreur: $e");
      rethrow;
    }
  }

  Future<String?> _getToken() async {
    return await widget.secureStorage.read(key: 'token');
  }

  Future<String?> _getUserId() async {
    return await widget.secureStorage.read(key: 'id');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCategoriesVideosCubit, ListCategoriesVideosState>(
      builder: (context, state) {
        List<VideoEntity> videosOfTheCategory = [];
        // for (var videoMap in state.getListOfCategories) {
        //   print("videoMap in getListOfCategories: $videoMap");

        //   if (videoMap.id == video.categoryId) {
        //     print("videoName: ${video.name}");
        //     videosOfTheCategory.add(video);
        //   }
        // }

        print("videos of the categories: $videosOfTheCategory");
        print(state.videosByCategory);
        List<VideoEntity> videoList =
            state.videosByCategory[widget.video.categoryId] ?? [];
        print("videoList: $videoList");
        return Scaffold(
          appBar: const CustomAppBar(leading: true),
          body: FutureBuilder(
            future: _getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError || snapshot.data == null) {
                return const Center(
                    child: Text('Token not found or error occurred.'));
              } else {
                final token = snapshot.data as String;
                final videoUrl =
                    "${ApiUrl.baseUrl}videos/watch-video/${widget.video.id}";
                print("video in video player: ${widget.video}");
                return FutureBuilder<BetterPlayerController>(
                  future: _initializePlayer(videoUrl, token, context),
                  builder: (context, playerSnapshot) {
                    if (playerSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (playerSnapshot.hasError ||
                        playerSnapshot.data == null) {
                      return const Center(child: Text('Error loading video.'));
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BetterPlayer(controller: playerSnapshot.data!),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.video.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "${getDay(widget.video.date.day)} ${getMonth(widget.video.date.month)} ${widget.video.date.year}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        width: 4,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[600],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "${widget.video.lenght} minutes",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Catégorie: ${widget.video.category}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.grey[600],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "Description de la vidéo...",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[800],
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(height: 1, color: Colors.grey),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "À suivre • ${videoList.length} vidéos",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: videoList.length,
                              itemBuilder: (context, index) {
                                final VideoEntity currentVideo =
                                    videoList[index];
                                final List<VideoEntity> filteredVideos = state
                                    .videosByCategory[widget.video.categoryId]!
                                    .where((v) => v.id != currentVideo.id)
                                    .toList();
                                print(
                                    "filteredVideos: ${filteredVideos.length}");
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        context.router.push(VideoPlayerRoute(
                                            video: currentVideo));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Miniature améliorée
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 160,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${ApiUrl.baseUrl}videos/thumbnails/${currentVideo.thumbnail}"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  // Overlay gradient
                                                  Positioned.fill(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .bottomCenter,
                                                          end: Alignment
                                                              .topCenter,
                                                          colors: [
                                                            Colors.black
                                                                .withOpacity(
                                                                    0.7),
                                                            Colors.transparent,
                                                          ],
                                                          stops: const [
                                                            0.0,
                                                            0.5
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Durée avec style amélioré
                                                  Positioned(
                                                    bottom: 8,
                                                    right: 8,
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 6,
                                                          vertical: 3),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Text(
                                                        "${currentVideo.lenght} min",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 0.5,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            // Informations de la vidéo avec style amélioré
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    currentVideo.name,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 0.2,
                                                      height: 1.3,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .calendar_today_outlined,
                                                        size: 14,
                                                        color: Colors.grey[600],
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        "${getDay(currentVideo.date.day)} ${getMonth(currentVideo.date.month)} ${currentVideo.date.year}",
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Colors.grey[600],
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      // Icon(
                                                      //   Icons
                                                      //       .play_circle_outline,
                                                      //   size: 14,
                                                      //   color: Colors.grey[600],
                                                      // ),
                                                      const SizedBox(width: 4),
                                                      // Text(
                                                      //   "Yoga ${currentVideo.category}",
                                                      //   style: TextStyle(
                                                      //     fontSize: 13,
                                                      //     color:
                                                      //         Colors.grey[600],
                                                      //     fontWeight:
                                                      //         FontWeight.w500,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}

getDay(int day) => day == 1 ? '1er' : day;

String getMonth(int month) {
  switch (month) {
    case 1:
      return 'janvier';
    case 2:
      return 'février';
    case 3:
      return 'mars';
    case 4:
      return 'avril';
    case 5:
      return 'mai';
    case 6:
      return 'juin';
    case 7:
      return 'juillet';
    case 8:
      return 'août';
    case 9:
      return 'septembre';
    case 10:
      return 'octobre';
    case 11:
      return 'novembre';
    case 12:
      return 'décembre';
    default:
      return '';
  }
}
