import 'package:dartz/dartz.dart';
import '../../../data/auth/models/signin_req_params.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
  Future<bool> isTokenRevoked();
}
