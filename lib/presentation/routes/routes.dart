import 'package:auto_route/auto_route.dart';
import 'package:mamaz_yoga/presentation/routes/profile_guard.dart';
import 'package:mamaz_yoga/presentation/routes/routes.gr.dart';
import 'guards.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthGuard authGuard = AuthGuard();
  final ProfileGuard profileGuard = ProfileGuard();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: DetailedArticleRoute.page, path: '/detailed_article'),
        //AutoRoute(page: ProfileRoute.page, path: '/profile', guards: [profileGuard]),
        AutoRoute(
          page: MainTabsRoute.page,
          path: '/main',
          children: [
            AutoRoute(page: HomeRoute.page, path: 'home'),
            AutoRoute(page: ArticlesRoute.page, path: 'articles'),
            AutoRoute(
                page: VideosRoute.page, path: 'videos', guards: [authGuard]),
            AutoRoute(page: HistoryRoute.page, path: 'history'),
            AutoRoute(page: ConditionalAuthRoute.page, path: 'profile'),
          ],
        ),
        AutoRoute(
          page: VideoListRoute.page,
          path: '/list/:categoryName',
          //guards: [authGuard],
        ),
        AutoRoute(
          page: VideoPlayerRoute.page,
          path: '/player/:categoryName/:videoName',
        ),
      ];
}
