import 'package:auto_route/auto_route.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'routes.gr.dart';

class ProfileGuard extends AutoRouteGuard {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final token = await _secureStorage.read(key: 'token');

    if (token != null) {
      resolver.next();
    } else {
      // Si l'utilisateur n'est pas authentifié, on redirige vers la page de connexion
      router.push(const LoginRoute());
    }
  }
}
