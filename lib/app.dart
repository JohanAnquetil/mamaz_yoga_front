import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'init_config.dart';
import 'presentation/blocs/articles/articles_bloc.dart';
import 'presentation/blocs/articles/articles_event.dart';
import 'presentation/blocs/list_categories_videos/list_categories_videos_cubit.dart';
import 'presentation/blocs/splash/splash_cubit.dart';
import 'presentation/blocs/user/user_bloc.dart';
import 'presentation/blocs/user/user_event.dart';
import 'presentation/routes/routes.dart';
import 'presentation/theme/app_theme.dart';

class MamazYogaApp extends StatefulWidget {
  const MamazYogaApp({super.key});

  @override
  State<MamazYogaApp> createState() => _MamazYogaAppState();
}

class _MamazYogaAppState extends State<MamazYogaApp> {
  final _appRouter = AppRouter();
  final FlutterSecureStorage storage = FlutterSecureStorage();

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
            create: (BuildContext context) => ListCategoriesVideosCubit()
              ..fetchListOfCategories()
              ..fetchAllVideos()
              ..fetchHistoricalVideos(79)),
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
