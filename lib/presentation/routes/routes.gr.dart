// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:mamaz_yoga/data/articles/models/article.dart' as _i15;
import 'package:mamaz_yoga/presentation/pages/articles_page.dart' as _i1;
import 'package:mamaz_yoga/presentation/pages/detailed_article_page.dart'
    as _i3;
import 'package:mamaz_yoga/presentation/pages/history_page.dart' as _i4;
import 'package:mamaz_yoga/presentation/pages/home_page.dart' as _i5;
import 'package:mamaz_yoga/presentation/pages/login_or_profile_page.dart'
    as _i2;
import 'package:mamaz_yoga/presentation/pages/login_page.dart' as _i6;
import 'package:mamaz_yoga/presentation/pages/main_tabs_page.dart' as _i7;
import 'package:mamaz_yoga/presentation/pages/profile_page.dart' as _i8;
import 'package:mamaz_yoga/presentation/pages/splash_page.dart' as _i9;
import 'package:mamaz_yoga/presentation/pages/video_list_screen.dart' as _i10;
import 'package:mamaz_yoga/presentation/pages/video_player_screen.dart' as _i11;
import 'package:mamaz_yoga/presentation/pages/videos_page.dart' as _i12;

/// generated route for
/// [_i1.ArticlesPage]
class ArticlesRoute extends _i13.PageRouteInfo<void> {
  const ArticlesRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ArticlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.ArticlesPage();
    },
  );
}

/// generated route for
/// [_i2.ConditionalAuthPage]
class ConditionalAuthRoute extends _i13.PageRouteInfo<void> {
  const ConditionalAuthRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ConditionalAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConditionalAuthRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.ConditionalAuthPage();
    },
  );
}

/// generated route for
/// [_i3.DetailedArticlePage]
class DetailedArticleRoute
    extends _i13.PageRouteInfo<DetailedArticleRouteArgs> {
  DetailedArticleRoute({
    _i14.Key? key,
    required _i15.Article article,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          DetailedArticleRoute.name,
          args: DetailedArticleRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailedArticleRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailedArticleRouteArgs>();
      return _i3.DetailedArticlePage(
        key: args.key,
        article: args.article,
      );
    },
  );
}

class DetailedArticleRouteArgs {
  const DetailedArticleRouteArgs({
    this.key,
    required this.article,
  });

  final _i14.Key? key;

  final _i15.Article article;

  @override
  String toString() {
    return 'DetailedArticleRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i4.HistoryPage]
class HistoryRoute extends _i13.PageRouteInfo<void> {
  const HistoryRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.HistoryPage();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginPage();
    },
  );
}

/// generated route for
/// [_i7.MainTabsPage]
class MainTabsRoute extends _i13.PageRouteInfo<void> {
  const MainTabsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainTabsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainTabsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainTabsPage();
    },
  );
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfilePage();
    },
  );
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashPage();
    },
  );
}

/// generated route for
/// [_i10.VideoListPage]
class VideoListRoute extends _i13.PageRouteInfo<VideoListRouteArgs> {
  VideoListRoute({
    _i14.Key? key,
    required String categoryName,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          VideoListRoute.name,
          args: VideoListRouteArgs(
            key: key,
            categoryName: categoryName,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoListRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoListRouteArgs>();
      return _i10.VideoListPage(
        key: args.key,
        categoryName: args.categoryName,
      );
    },
  );
}

class VideoListRouteArgs {
  const VideoListRouteArgs({
    this.key,
    required this.categoryName,
  });

  final _i14.Key? key;

  final String categoryName;

  @override
  String toString() {
    return 'VideoListRouteArgs{key: $key, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i11.VideoPlayerPage]
class VideoPlayerRoute extends _i13.PageRouteInfo<VideoPlayerRouteArgs> {
  VideoPlayerRoute({
    _i14.Key? key,
    required String categoryName,
    required String videoName,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          VideoPlayerRoute.name,
          args: VideoPlayerRouteArgs(
            key: key,
            categoryName: categoryName,
            videoName: videoName,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoPlayerRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VideoPlayerRouteArgs>();
      return _i11.VideoPlayerPage(
        key: args.key,
        categoryName: args.categoryName,
        videoName: args.videoName,
      );
    },
  );
}

class VideoPlayerRouteArgs {
  const VideoPlayerRouteArgs({
    this.key,
    required this.categoryName,
    required this.videoName,
  });

  final _i14.Key? key;

  final String categoryName;

  final String videoName;

  @override
  String toString() {
    return 'VideoPlayerRouteArgs{key: $key, categoryName: $categoryName, videoName: $videoName}';
  }
}

/// generated route for
/// [_i12.VideosPage]
class VideosRoute extends _i13.PageRouteInfo<void> {
  const VideosRoute({List<_i13.PageRouteInfo>? children})
      : super(
          VideosRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideosRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.VideosPage();
    },
  );
}
