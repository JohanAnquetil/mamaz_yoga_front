import 'package:get_it/get_it.dart';
import 'package:mamaz_yoga/core/network/dio_client.dart';
import 'package:mamaz_yoga/data/auth/repositories/auth.dart';
import 'package:mamaz_yoga/data/sources/auth_api_service.dart';
import 'package:mamaz_yoga/data/user/repositories/user.dart';
import 'package:mamaz_yoga/domain/auth/repositories/auth.dart';
import 'package:mamaz_yoga/domain/auth/usescases/is_logged_in.dart';
import 'package:mamaz_yoga/domain/user/repositories/user.dart';
import 'package:mamaz_yoga/domain/user/usecases/get_users.dart';

GetIt getIt = GetIt.instance;

Future<void> initConfig() async {
// Dio
  getIt.registerSingleton<DioClient>(DioClient());

// Usecases
  getIt.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  getIt.registerSingleton<GetUserUseCase>(GetUserUseCase());

// Repositories
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<AuthService>(AuthApiServiceImpl());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
}



/// Archives
  // getIt.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());
  // getIt.registerFactory<ArticlesBloc>(
  //     () => ArticlesBloc(getIt<ArticlesRemoteDataSource>()));

  // getIt.registerSingleton<SigninUseCase>(SigninUseCase());
  // getIt.registerFactory<DetailedArticleBloc>(() => DetailedArticleBloc());

