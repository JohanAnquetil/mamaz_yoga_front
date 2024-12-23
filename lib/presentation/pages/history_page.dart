import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import '../../core/constants/api_url.dart';
import '../blocs/list_categories_videos/list_categories_videos_cubit.dart';
import '../blocs/list_categories_videos/list_categories_videos_state.dart';
import '../routes/routes.gr.dart';
import '../theme/app_theme.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  static const route = '/history';
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    // Utiliser PostFrameCallback pour éviter les appels pendant le build
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   print('=== PostFrameCallback ===');
    //   getToken().then((token) {
    //     print(token);
    //     int userId = JwtDecoder.decode(token!)['id'];
    //     if (userId != null) {
    //       context
    //           .read<ListCategoriesVideosCubit>()
    //           .fetchHistoricalVideos(userId);
    //     }
    //   });
    // });

    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<ListCategoriesVideosCubit, ListCategoriesVideosState>(
        builder: (context, state) {
          if (state.status == ListCategoriesStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.historicalVideos.isEmpty) {
            return Center(
              child: Text(
                'Aucun historique disponible',
                style: AppTheme.textTheme.titleMedium,
              ),
            );
          }

          print(
              "state et historical : ${state.historicalVideos}"); // Affiche les vidéos historiques dans la console
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Votre historique",
                      style: AppTheme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Divider(
                  height: 3,
                  color: AppTheme.goldColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (state.historicalVideos.isNotEmpty)
                // Premier élément (largeur complète)
                SizedBox(
                  height: MediaQuery.sizeOf(context).height *
                      0.35, // 1/4 de l'écran
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => context.router.push(
                      VideoPlayerRoute(video: state.historicalVideos[0]),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.35,
                              child: Image.network(
                                "${ApiUrl.baseUrl}videos/thumbnails/${state.historicalVideos[0].thumbnail}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Positioned(
                          //   bottom: 60,
                          //   right: 15,
                          //   child: Container(
                          //     padding: const EdgeInsets.symmetric(
                          //       horizontal: 8,
                          //       vertical: 4,
                          //     ),
                          //     decoration: BoxDecoration(
                          //       color: AppTheme.redColor,
                          //       borderRadius: BorderRadius.circular(12),
                          //     ),
                          //     child: Text(
                          //       "${state.historicalVideos[0].name}",
                          //       maxLines: 1,
                          //       overflow: TextOverflow.ellipsis,
                          //       style: const TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Positioned(
                          // bottom: 15,
                          // right: 15,
                          // child: Container(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 8,
                          //     vertical: 4,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     color: AppTheme.goldColor,
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   child: Text(
                          //     state.historicalVideos[0].category,
                          //     maxLines: 1,
                          //     overflow: TextOverflow.ellipsis,
                          //     style: const TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          // Text(
                          //   "${state.historicalVideos[0].category}",
                          //   maxLines: 2,
                          //   overflow: TextOverflow.ellipsis,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20,
                          //     shadows: [
                          //       Shadow(
                          //         color: Colors.black,
                          //         offset: Offset(1, 1),
                          //         blurRadius: 3,
                          //       ),
                          //       Shadow(
                          //         color: Colors.black,
                          //         offset: Offset(-1, -1),
                          //         blurRadius: 3,
                          //       ),
                          //       Shadow(
                          //         color: Colors.black,
                          //         offset: Offset(1, -1),
                          //         blurRadius: 3,
                          //       ),
                          //       Shadow(
                          //         color: Colors.black,
                          //         offset: Offset(-1, 1),
                          //         blurRadius: 3,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),

              // Reste des vidéos en grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: state.historicalVideos.length - 1,
                  itemBuilder: (context, index) {
                    final video = state.historicalVideos[index + 1];
                    return GestureDetector(
                      onTap: () =>
                          context.router.push(VideoPlayerRoute(video: video)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // Image
                              Image.network(
                                "${ApiUrl.baseUrl}videos/thumbnails/${video.thumbnail}",
                                fit: BoxFit.cover,
                              ),
                              // Gradient overlay
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.7),
                                    ],
                                  ),
                                ),
                              ),
                              // Content
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppTheme.goldColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        video.category,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
