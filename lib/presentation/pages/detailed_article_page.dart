import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:mamaz_yoga/init_config.dart';
import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_article_events.dart';
import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_article_state.dart';
import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_article_status.dart';
import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_articled_bloc.dart';
import 'package:mamaz_yoga/presentation/theme/app_theme.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_app_bar.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_network_image.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_video_player.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class DetailedArticlePage extends StatelessWidget {
  static const route = '/detailed_article';
  final int id;

  const DetailedArticlePage({
    super.key,
    required this.id,
  });

  Future<bool> _launchURL(String? url) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      return true;
    }
    return false;
  }

  String _replaceBullets(String content) {
    return content.replaceAll('ü', '\u2705');
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('d MMMM yyyy', 'fr_FR');
    return Scaffold(
      appBar: CustomAppBar(
        leading: true,
      ),
      body: BlocProvider(
        create: (BuildContext context) =>
            getIt<DetailedArticleBloc>()..add(DetailedArticlesLoadingEvent(id)),
        child: BlocBuilder<DetailedArticleBloc, DetailedArticleState>(
          builder: (context, state) {
            print("state united: $state");
            if (state.status == DetailedArticleStatus.loading) {
              print("loading");
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == DetailedArticleStatus.loaded) {
              print(
                  "article in DetailedArticleLoadedEvent: ${state.article.toString()}");
              final article = state.article;
              final formattedDate =
                  dateFormat.format(DateTime.parse(article.date));
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: article.detailedArticle.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          formattedDate,
                          style: AppTheme.textTheme.bodySmall,
                        ),
                      );
                    }
                    final item = article.detailedArticle[index - 1];
                    switch (item['type']) {
                      case 'titre':
                        index++;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HtmlWidget(
                              item['contenu'] ?? '',
                              textStyle: AppTheme.textTheme.titleMedium
                                  ?.copyWith(
                                      color: index == 2
                                          ? AppTheme.redColor
                                          : AppTheme.goldColor,
                                      fontWeight: FontWeight.bold),
                              onTapUrl: (url) => _launchURL(url),
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      case 'paragraphe':
                        return Column(
                          children: [
                            HtmlWidget(
                              _replaceBullets(item['contenu'] ?? ''),
                              onTapUrl: (url) => _launchURL(url),
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      case 'image':
                        return Column(
                          children: [
                            CustomNetworkImage(
                                imagePath: item['contenu'],
                                width: MediaQuery.of(context).size.width),
                            const SizedBox(height: 16),
                          ],
                        );
                      case 'video':
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: CustomVideoPlayer(
                                videoUrl: item['contenu'],
                                isYoutubeVideo: true,
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              );
            } else if (state.status == DetailedArticleStatus.failure) {
              return SnackBar(
                content: Text("Erreur de chargement de l'article"),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocBuilder<DetailedArticleBloc, DetailedArticleState>(
//         bloc: _detailedArticleBloc,
//         builder: (context, state) {
//           if (state is DetailedArticleLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is DetailedArticleLoaded) {
//             final article = state.article;
//             final formattedDate =
//                 dateFormat.format(DateTime.parse(article.date));
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ListView.builder(
//                 itemCount: widget.article.detailedArticle.length + 1,
//                 itemBuilder: (BuildContext context, int index) {
//                   if (index == 0) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 16.0),
//                       child: Text(
//                         formattedDate,
//                         style: AppTheme.textTheme.bodySmall,
//                       ),
//                     );
//                   }
//                   final item = widget.article.detailedArticle[index - 1];
//                   switch (item['type']) {
//                     case 'titre':
//                       index++;
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           HtmlWidget(
//                             item['contenu'] ?? '',
//                             textStyle: AppTheme.textTheme.titleMedium?.copyWith(
//                                 color: index == 2
//                                     ? AppTheme.redColor
//                                     : AppTheme.goldColor,
//                                 fontWeight: FontWeight.bold),
//                             onTapUrl: (url) => _launchURL(url),
//                           ),
//                           const SizedBox(height: 16),
//                         ],
//                       );
//                     case 'paragraphe':
//                       return Column(
//                         children: [
//                           HtmlWidget(
//                             _replaceBullets(item['contenu'] ?? ''),
//                             onTapUrl: (url) => _launchURL(url),
//                           ),
//                           const SizedBox(height: 16),
//                         ],
//                       );
//                     case 'image':
//                       return Column(
//                         children: [
//                           CustomNetworkImage(
//                               imagePath: item['contenu'],
//                               width: MediaQuery.of(context).size.width),
//                           const SizedBox(height: 16),
//                         ],
//                       );
//                     case 'video':
//                       return Column(
//                         children: [
//                           SizedBox(
//                             height: 200,
//                             child: CustomVideoPlayer(
//                               videoUrl: item['contenu'],
//                               isYoutubeVideo: true,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                         ],
//                       );
//                     default:
//                       return Container();
//                   }
//                 },
//               ),
//             );
//           } else if (state is DetailedArticleLoadingFailure) {
//             return ErrorWidgetWithRetry(
//               errorMessage: "Erreur de chargement de l'article",
//               onRetry: () {
//                 _detailedArticleBloc.add(LoadDetailedArticle(widget.article));
//               },
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
// 