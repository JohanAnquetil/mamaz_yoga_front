import 'package:dartz/dartz.dart';
import 'package:mamaz_yoga/core/usecase.dart';
import 'package:mamaz_yoga/data/user/models/user_req_params.dart';
import 'package:mamaz_yoga/domain/user/repositories/user.dart';
import 'package:mamaz_yoga/init_config.dart';

class GetUserUseCase implements UseCase<Either, UserParams> {
  @override
  Future<Either> call({UserParams? params}) async {
    if (params == null) {
      throw ArgumentError('UserParams cannot be null');
    }
    return await getIt<UserRepository>().getUser(params.id);
  }
}
