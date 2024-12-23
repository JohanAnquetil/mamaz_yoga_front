import 'package:get_it/get_it.dart';
import 'core/network/dio_client.dart';
import 'data/auth/repositories/auth.dart';
import 'data/news/repositories/articles.dart';
import 'data/sources/auth_api_service.dart';
import 'data/user/repositories/user.dart';
import 'data/videos/repositories/video_impl.dart';
import 'domain/articles/repositories/articles_remote_data_source.dart';
import 'domain/articles/usecases/get_articles.dart';
import 'domain/auth/repositories/auth.dart';
import 'domain/auth/usescases/is_logged_in.dart';
import 'domain/auth/usescases/sign_in.dart';
import 'domain/user/repositories/user.dart';
import 'domain/user/usecases/get_users.dart';
import 'domain/videos/repositories/video_repository.dart';
import 'domain/videos/usecases/get_all_videos.dart';
import 'domain/videos/usecases/get_historic.dart';
import 'domain/videos/usecases/get_list_of_categories_usecase.dart';
import 'presentation/blocs/articles/articles_bloc.dart';
import 'presentation/blocs/detailed_article/detailed_articled_bloc.dart';
import 'presentation/blocs/list_categories_videos/list_categories_videos_cubit.dart';
import 'presentation/blocs/user/user_bloc.dart';

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
  getIt.registerSingleton<GetAllVideosUsecase>(GetAllVideosUsecase());
  getIt.registerSingleton<GetListOfCategoriesUsecase>(
      GetListOfCategoriesUsecase());
  getIt.registerSingleton<GetHistoricByIdUsecase>(GetHistoricByIdUsecase());

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

