import 'package:dartz/dartz.dart';
import 'package:mamaz_yoga/data/sources/auth_api_service.dart';
import 'package:mamaz_yoga/domain/user/repositories/user.dart';
import 'package:mamaz_yoga/init_config.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either> getUser(int id) async {
    var user = await getIt<AuthService>().getUser(id);
    return user.fold((error) => Left(error), (success) => Right(success));
  }
}