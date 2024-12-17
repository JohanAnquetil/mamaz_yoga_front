import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/init_config.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_event.dart';
import 'package:mamaz_yoga/presentation/blocs/list_categories_videos/list_categories_videos_cubit.dart';
import 'package:mamaz_yoga/presentation/blocs/splash/splash_cubit.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_event.dart';
import 'package:mamaz_yoga/presentation/routes/routes.dart';
import 'package:mamaz_yoga/presentation/theme/app_theme.dart';

class MamazYogaApp extends StatefulWidget {
  const MamazYogaApp({super.key});

  @override
  State<MamazYogaApp> createState() => _MamazYogaAppState();
}

class _MamazYogaAppState extends State<MamazYogaApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<ArticlesBloc>(
        //   create: (BuildContext context) => getIt<ArticlesBloc>(),
        // ),
        BlocProvider<SplashCubit>(
          create: (BuildContext context) => SplashCubit()..appStarted(),
        ),
        BlocProvider<ListCategoriesVideosCubit>(
          create: (BuildContext context) =>
              ListCategoriesVideosCubit()..fetchListOfCategories(),
        ),
        BlocProvider<ArticlesBloc>(
          create: (BuildContext context) =>
              getIt<ArticlesBloc>()..add(ArticlesLoadingEvent()),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) =>
              getIt<UserBloc>()..add(UserLoaded()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        theme: AppTheme.theme,
      ),
    );
  }
}
