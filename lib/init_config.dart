import 'package:get_it/get_it.dart';
import 'package:mamaz_yoga/core/network/dio_client.dart';
import 'package:mamaz_yoga/data/auth/repositories/auth.dart';
import 'package:mamaz_yoga/data/sources/auth_api_service.dart';
import 'package:mamaz_yoga/data/user/repositories/user.dart';
import 'package:mamaz_yoga/domain/auth/repositories/auth.dart';
import 'package:mamaz_yoga/domain/auth/usescases/is_logged_in.dart';
import 'package:mamaz_yoga/domain/user/repositories/user.dart';
// import 'package:mamaz_yoga/presentation/blocs/articles/articles_bloc.dart';
// import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_article_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> initConfig() async {
  // final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  // dio.interceptors.add(InterceptorsWrapper(
  //   onRequest: (options, handler) async {
  //     final token = await const FlutterSecureStorage().read(key: 'token');
  //     if (token != null) {
  //       options.headers['Authorization'] = 'Bearer $token';
  //     }
  //     return handler.next(options);
  //   },
  // ));

  // getIt.registerLazySingleton<Dio>(() {
  //   return dio;
  // });

  getIt.registerSingleton<DioClient>(DioClient());

  getIt.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  // getIt.registerLazySingleton<VideoRepository>(() => VideoRepositoryImpl());

  // getIt.registerFactory<VideoCubit>(() => VideoCubit(VideoRepositoryImpl()));

  // getIt.registerLazySingleton<ArticlesRemoteDataSource>(
  //     () => ArticlesRemoteDataSourceImpl());

  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<AuthService>(AuthApiServiceImpl());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());

  // getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());
  // getIt.registerFactory<ArticlesBloc>(
  //     () => ArticlesBloc(getIt<ArticlesRemoteDataSource>()));

  // getIt.registerSingleton<SigninUseCase>(SigninUseCase());
  // getIt.registerFactory<DetailedArticleBloc>(() => DetailedArticleBloc());
}
