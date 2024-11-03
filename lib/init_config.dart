import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mamaz_yoga/data/data_sources/remote/articles/articles_remote_data_source_impl.dart';
import 'package:mamaz_yoga/data/data_sources/remote/login/login_remote_data_source_impl.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_article_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/videos/videos_cubit.dart';

import 'core/constants.dart';
import 'data/data_sources/remote/articles/articles_remote_data_source.dart';
import 'data/data_sources/remote/login/login_remote_data_source.dart';
import 'data/data_sources/remote/videos/video_repository_impl.dart';
import 'data/data_sources/remote/videos/video_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> initConfig() async {
  final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final token = await const FlutterSecureStorage().read(key: 'token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
  ));

  getIt.registerLazySingleton<Dio>(() {
    return dio;
  });

  getIt.registerLazySingleton<VideoRepository>(() => VideoRepositoryImpl());

  getIt.registerFactory<VideoCubit>(() => VideoCubit(VideoRepositoryImpl()));

  getIt.registerLazySingleton<ArticlesRemoteDataSource>(() {
    return ArticlesRemoteDataSourceImpl();
  });

  getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());

  registerBlocs();
}

void registerBlocs() {
  getIt.registerFactory<ArticlesBloc>(() {
    return ArticlesBloc(getIt<ArticlesRemoteDataSource>());
  });

  getIt.registerFactory<DetailedArticleBloc>(() {
    return DetailedArticleBloc();
  });
}
