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
    print("i am here");
    String? token = await storage.read(key: 'token') ?? "";
    print("token in repo auth: $token");
    bool isTokenExpired = false;

    if (token != "") {
      isTokenExpired = JwtDecoder.isExpired(token);
      print('isTokenExpired: $isTokenExpired');
    }

    if (token.isEmpty || isTokenExpired) {
      print("It's empty: false");
      return false;
    } else {
      print("It's true");
      return true;
    }
  }

  @override
  Future<bool> isTokenRevoked() async {
    String? token = await storage.read(key: 'token') ?? "";
    print("recorded token in auth repository: $token");
    bool isTokenExpired = false;

    if (token != "") {
      isTokenExpired = JwtDecoder.isExpired(token);
      return isTokenExpired;
    } else {
      return false;
    }
  }
}
