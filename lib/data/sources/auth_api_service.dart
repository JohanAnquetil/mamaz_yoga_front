import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mamaz_yoga/core/constants/api_url.dart';
import 'package:mamaz_yoga/core/network/dio_client.dart';
import 'package:mamaz_yoga/data/auth/models/signin_req_params.dart';
import 'package:mamaz_yoga/init_config.dart';

abstract class AuthService {
  Future<Either> signin(SigninReqParams params);
  Future<Either> getUser(int id);
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response = await getIt<DioClient>().post(
        ApiUrl.signIn,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getUser(int id) async {
    try {
      var response = await getIt<DioClient>().get(ApiUrl.userById(id));
      return Right(response.data.map((e) => print(e)));
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
