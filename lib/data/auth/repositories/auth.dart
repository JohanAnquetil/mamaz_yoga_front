import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mamaz_yoga/data/auth/models/signin_req_params.dart';
import 'package:mamaz_yoga/data/sources/auth_api_service.dart';
import 'package:mamaz_yoga/domain/auth/repositories/auth.dart';
import 'package:mamaz_yoga/init_config.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepositoryImpl extends AuthRepository {
  final storage = const FlutterSecureStorage();

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await getIt<AuthService>().signin(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      print("data:$data");
      await storage.write(key: 'token', value: data['token']);
      return Right(data);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    String? token = await storage.read(key: 'token') ?? "";
    bool isTokenExpired = JwtDecoder.isExpired(token);

    if (token.isEmpty && !isTokenExpired) {
      return false;
    } else {
      return true;
    }
  }
}
