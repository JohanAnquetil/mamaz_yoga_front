import 'package:dartz/dartz.dart';
import 'package:mamaz_yoga/core/usecase.dart';
import 'package:mamaz_yoga/data/auth/models/signin_req_params.dart';
import 'package:mamaz_yoga/domain/auth/repositories/auth.dart';
import 'package:mamaz_yoga/init_config.dart';

class SigninUseCase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await getIt<AuthRepository>().signin(params!);
  }
}
