import '../../../../domain/entities/user.dart';
abstract class LoginRemoteDataSource  {
  Future<User?> logIn(String username, String password);
  Future<void> logout();
  Future<String?> getToken();
  Future<bool> isAuthenticated();
  Future<User?> getUser();
}