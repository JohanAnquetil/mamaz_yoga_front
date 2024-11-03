import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_bloc.dart';
import 'package:mamaz_yoga/presentation/routes/routes.dart';
import 'package:mamaz_yoga/presentation/theme/app_theme.dart';

import 'init_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ArticlesBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        theme: AppTheme.theme,
      ),
    );
  }
}
