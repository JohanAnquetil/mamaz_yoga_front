import '../../../core/usecase.dart';
import '../repositories/auth.dart';
import '../../../init_config.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await getIt<AuthRepository>().isLoggedIn();
  }
}
