import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/api_url.dart';
import '../../domain/videos/entities/video.dart';
import '../blocs/list_categories_videos/list_categories_videos_cubit.dart';
import '../blocs/list_categories_videos/list_categories_videos_state.dart';
import '../routes/routes.gr.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

@RoutePage()
class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  // Map pour stocker les controllers par catégorie
  final Map<int, PageController> _pageControllers = {};
  // Map pour stocker la page courante par catégorie
  final Map<int, int> _currentPages = {};

  @override
  void initState() {
    super.initState();
    // Appel initial uniquement au démarrage
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ListCategoriesVideosCubit>().fetchListOfCategories();
    });
  }

  @override
  void dispose() {
    // Nettoyer tous les controllers
    _pageControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  // Obtenir ou créer un controller pour une catégorie
  PageController _getControllerForCategory(int categoryId) {
    if (!_pageControllers.containsKey(categoryId)) {
      _pageControllers[categoryId] = PageController();
      _currentPages[categoryId] = 0;
    }
    return _pageControllers[categoryId]!;
  }

  // Indicateur de page spécifique à la catégorie
  Widget _buildPageIndicator(List<VideoEntity> videos, int categoryId) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        videos.length,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPages[categoryId] == index
                ? AppTheme.goldColor
                : Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<ListCategoriesVideosCubit, ListCategoriesVideosState>(
        builder: (context, state) {
          if (state.status == ListCategoriesStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ListCategoriesStatus.success) {
            return ListView.builder(
              itemCount: state.getListOfCategories.length,
              itemBuilder: (context, index) {
                final category = state.getListOfCategories[index];
                final videos = state.videosByCategory[category.id] ?? [];
                print("video in video_page: $videos");

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category.category.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.goldColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller:
                                  _getControllerForCategory(category.id),
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPages[category.id] = index;
                                });
                              },
                              itemCount: videos.length,
                              itemBuilder: (context, videoIndex) {
                                final video = videos[videoIndex];
                                bool hasViewedVideo = false;

                                print("IDs des vidéos dans l'historique:");
                                for (var historicVideo
                                    in state.historicalVideos) {
                                  print(
                                      "ID: ${historicVideo.id}, Nom: ${historicVideo.name}");
                                  if (historicVideo.id == video.id) {
                                    hasViewedVideo = true;
                                  }
                                }

                                print(
                                    "id historical vidéos : ${state.historicalVideos}");

                                return GestureDetector(
                                  onTap: () {
                                    context.router
                                        .push(VideoPlayerRoute(video: video));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 10,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SizedBox(
                                        width: 380,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Image thumbnail
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  // Image de base
                                                  Image.network(
                                                    "${ApiUrl.baseUrl}videos/thumbnails/${video.thumbnail}",
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Container(
                                                        color: Colors.grey,
                                                        child: const Icon(
                                                          Icons.error,
                                                        ),
                                                      );
                                                    },
                                                  ),

                                                  // Overlay sombre + icône si la vidéo a été vue
                                                  if (hasViewedVideo)
                                                    Positioned.fill(
                                                      child: Container(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        child: const Positioned(
                                                          bottom: 5,
                                                          right: 5,
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_outline,
                                                            color: Colors.white,
                                                            size: 40,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            // Titre de la vidéo
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                video.name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: AppTheme
                                                    .textTheme.bodySmall,
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
                          ),
                          const SizedBox(height: 16),
                          _buildPageIndicator(videos, category.id),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          } else {
            return Center(child: Text(state.error ?? "error"));
          }
        },
      ),
    );
  }
}
