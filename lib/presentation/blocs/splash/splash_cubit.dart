import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mamaz_yoga/data/user/models/user_req_params.dart';
import 'package:mamaz_yoga/domain/auth/usescases/is_logged_in.dart';
import 'package:mamaz_yoga/domain/user/usecases/get_users.dart';
import 'package:mamaz_yoga/init_config.dart';
import 'package:mamaz_yoga/presentation/blocs/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    final storage = const FlutterSecureStorage();
    await Future.delayed(const Duration(seconds: 2));
    bool isLoggedIn = await getIt<IsLoggedInUseCase>().call();
    if (isLoggedIn) {}
    String? token = await storage.read(key: 'token') ?? "";
    print("in splash cubit");
    print("token: $token");
    if (!isLoggedIn) {
      print("!isLoggedIn");
      emit(UnAuthenticated());
      return;
    }
    if (token != "") {
      print("I am here");
      int idUserFromToken = JwtDecoder.decode(token)['id'].toInt();
      print("idUserFromToken: $idUserFromToken");
      final result = await getIt<GetUserUseCase>()
          .call(params: UserParams(idUserFromToken));
      print(result);
      result.fold((failure) {
        print(failure);
      }, (success) {
        print({state.toString()});
        if (isLoggedIn) {
          emit(Authenticated(success['data']));
        } else {
          emit(UnAuthenticated());
        }
        print("success: $success");
      });
    }
  }
}
