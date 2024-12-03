import 'package:mamaz_yoga/core/usecase.dart';
import 'package:mamaz_yoga/domain/auth/repositories/auth.dart';
import 'package:mamaz_yoga/init_config.dart';

class IsTokenRevokedUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await getIt<AuthRepository>().isTokenRevoked();
  }
}
