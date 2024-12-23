import 'package:dartz/dartz.dart';
import '../../../core/usecase.dart';
import '../../../data/user/models/user_req_params.dart';
import '../repositories/user.dart';
import '../../../init_config.dart';

class GetUserUseCase implements UseCase<Either, UserParams> {
  @override
  Future<Either> call({UserParams? params}) async {
    if (params == null) {
      throw ArgumentError('UserParams cannot be null');
    }
    return await getIt<UserRepository>().getUser(params.id);
  }
}
