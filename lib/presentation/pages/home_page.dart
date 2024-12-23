import 'package:auto_route/auto_route.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mamaz_yoga/presentation/utils/get_token.dart';
import '../../core/constants/api_url.dart';
import '../../domain/videos/entities/video.dart';
import '../blocs/articles/articles_bloc.dart';
import '../blocs/articles/articles_state.dart';
import '../blocs/list_categories_videos/list_categories_videos_cubit.dart';
import '../blocs/list_categories_videos/list_categories_videos_state.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_state.dart';
import '../blocs/user/user_status.dart';
import '../routes/routes.gr.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  static const route = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    // Utiliser PostFrameCallback pour éviter les appels pendant le build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('=== PostFrameCallback ===');
      getToken().then((token) {
        print(token);
        int userId = JwtDecoder.decode(token!)['id'];
        if (userId != null) {
          context
              .read<ListCategoriesVideosCubit>()
              .fetchHistoricalVideos(userId);
        }
      });
    });
    debugPrint("Container color: ${Theme.of(context).scaffoldBackgroundColor}");
    return Scaffold(
        appBar: CustomAppBar(),
        body: BlocBuilder<ListCategoriesVideosCubit, ListCategoriesVideosState>(
            builder: (videoContext, videoState) {
          print("BlocVideos: $videoState");
          print("historic videos in home : ${videoState.historicalVideos}");
          print(
              "BlocBuilder state: ${videoState.status}, Videos: ${videoState.listOfVideos}");
          var lastVideos = videoState.listOfVideos
            ..sort((a, b) => a.date.compareTo(b.date))
            ..take(5);
          print("dernières vidéos:");
          print(lastVideos);
          return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            print("state: $state");
            if (state.status == UserStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.status == UserStatus.authenticated) {
              return BlocBuilder<ArticlesBloc, ArticlesState>(
                builder: (context, articleState) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        if (videoState.listOfVideos.isNotEmpty)
                          _buildLatestVideosSwiper(
                              videoState.listOfVideos.cast<VideoEntity>(),
                              context,
                              'Dernières vidéos'),
                        SizedBox(
                          height: 30,
                        ),
                        if (videoState.historicalVideos.isNotEmpty)
                          _buildLatestVideosSwiper(videoState.historicalVideos,
                              context, 'Votre historique'),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Derniers articles',
                                    style: AppTheme.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            height: 3,
                            color: AppTheme.goldColor,
                          ),
                        ),
                        SizedBox(
                          height: 350,
                          child: articleState.articleEntity.isNotEmpty
                              ? ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final article =
                                        articleState.articleEntity[index];
                                    return GestureDetector(
                                      onTap: () {
                                        print("tap:${article.id}");
                                        AutoRouter.of(context).push(
                                          DetailedArticleRoute(id: article.id),
                                        );
                                      },
                                      child: SizedBox(
                                        height: 350,
                                        width: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 7.0),
                                                child: Text(
                                                  DateFormat('d MMMM yyyy')
                                                      .format(DateTime.parse(
                                                          article.date))
                                                      .toString(),
                                                  style: AppTheme
                                                      .textTheme.bodySmall,
                                                ),
                                              ),
                                              Card(
                                                  color: AppTheme.pinkColor,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        height: 170,
                                                        width: double.infinity,
                                                        child: Image.network(
                                                          article.image ?? "",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 15),
                                                        child: SizedBox(
                                                          height: 100,
                                                          child: Text(
                                                            style: AppTheme
                                                                .textTheme
                                                                .bodySmall,
                                                            article.title,
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : Container(),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            if (state.status == UserStatus.unauthenticated) {
              return const Center(
                child: Text('Please log in to continue.'),
              );
            }

            if (state.status == UserStatus.error) {
              return Center(
                child: Text(
                    'An error occurred: ${state.errorMessage ?? 'Unknown error'}'),
              );
            }

            // État inattendu (optionnel, pour le débogage)
            return const Center(
              child: Text('Unexpected state.'),
            );
          });
        }));
  }

  Widget _buildLatestVideosSwiper(
      List<VideoEntity> videos, BuildContext context, String title) {
    // final latestVideos = List<VideoEntity>.from(videos)
    //   ..sort((a, b) => b.date.compareTo(a.date))
    //   ..take(5).toList();
    print("allVideos: $videos");
    //print("latestVideos: $latestVideos");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: AppTheme.textTheme.titleMedium,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(
            height: 3,
            color: AppTheme.goldColor,
          ),
        ),
        SizedBox(
          height: 300,
          child: CardSwiper(
            cardsCount: videos.length,
            cardBuilder:
                (context, index, percentThresholdX, percentThresholdY) {
              final video = videos[index];
              return GestureDetector(
                onTap: () =>
                    context.router.push(VideoPlayerRoute(video: video)),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "${ApiUrl.baseUrl}videos/thumbnails/${video.thumbnail}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Text(
                          video.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
