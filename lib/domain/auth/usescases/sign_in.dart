import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../../../data/auth/models/signin_req_params.dart';
import '../repositories/auth.dart';
import '../../../init_config.dart';

class SigninUseCase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await getIt<AuthRepository>().signin(params!);
  }
}
