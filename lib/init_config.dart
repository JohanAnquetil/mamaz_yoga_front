import 'package:get_it/get_it.dart';
import 'package:mamaz_yoga/core/network/dio_client.dart';
import 'package:mamaz_yoga/data/auth/repositories/auth.dart';
import 'package:mamaz_yoga/data/news/repositories/articles.dart';
import 'package:mamaz_yoga/data/sources/auth_api_service.dart';
import 'package:mamaz_yoga/data/user/repositories/user.dart';
import 'package:mamaz_yoga/data/videos/repositories/video_impl.dart';
import 'package:mamaz_yoga/domain/articles/repositories/articles_remote_data_source.dart';
import 'package:mamaz_yoga/domain/articles/usecases/get_articles.dart';
import 'package:mamaz_yoga/domain/auth/repositories/auth.dart';
import 'package:mamaz_yoga/domain/auth/usescases/is_logged_in.dart';
import 'package:mamaz_yoga/domain/auth/usescases/sign_in.dart';
import 'package:mamaz_yoga/domain/user/repositories/user.dart';
import 'package:mamaz_yoga/domain/user/usecases/get_users.dart';
import 'package:mamaz_yoga/domain/videos/repositories/video_repository.dart';
import 'package:mamaz_yoga/domain/videos/usecases/get_list_of_categories_usecase.dart';
import 'package:mamaz_yoga/presentation/blocs/articles/articles_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/detailed_article/detailed_articled_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/list_categories_videos/list_categories_videos_cubit.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> initConfig() async {
// Dio
  getIt.registerSingleton<DioClient>(DioClient());

// Usecases
  getIt.registerSingleton<SigninUseCase>(SigninUseCase());
  getIt.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  getIt.registerSingleton<GetUserUseCase>(GetUserUseCase());
  getIt.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase());
  getIt.registerSingleton<GetArticleUseCase>(GetArticleUseCase());
  getIt.registerSingleton<GetListOfCategoriesUsecase>(
      GetListOfCategoriesUsecase());

// Repositories
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<AuthService>(AuthApiServiceImpl());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  getIt.registerSingleton<ArticlesRepository>(ArticlesRepositoryImpl());
  getIt.registerSingleton<VideoRepository>(VideosRepositoryImpl());

// Bloc - Cubit

  getIt.registerSingleton<UserBloc>(UserBloc());
  getIt.registerSingleton<ArticlesBloc>(ArticlesBloc());
  getIt.registerFactory<DetailedArticleBloc>(() => DetailedArticleBloc());
  getIt.registerSingleton<ListCategoriesVideosCubit>(
      ListCategoriesVideosCubit());
}



/// Archives
  // getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());
  // getIt.registerFactory<ArticlesBloc>(
  //     () => ArticlesBloc(getIt<ArticlesRemoteDataSource>()));

  // getIt.registerSingleton<SigninUseCase>(SigninUseCase());
  // getIt.registerFactory<DetailedArticleBloc>(() => DetailedArticleBloc());

