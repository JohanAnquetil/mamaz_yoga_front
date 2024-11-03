  import 'package:dio/dio.dart';
  import 'package:flutter_secure_storage/flutter_secure_storage.dart';
  import 'package:mamaz_yoga/data/data_sources/remote/login/login_remote_data_source.dart';
  import 'package:mamaz_yoga/domain/entities/user.dart';

  import '../../../../init_config.dart';

  class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
    LoginRemoteDataSourceImpl();

    static const storage = FlutterSecureStorage();

    @override
    Future<User?> logIn(String username, String password) async {
      final dio = getIt<Dio>();
      dio.options.headers['content-Type'] = 'application/json';
      try {
        final response = await dio.post('/login', data: {"username": username, "password": password});
        if (response.statusCode == 201) {
          print('Response data: ${response.data}');

          final token = response.data['token'];
          await storage.write(key: 'token', value: token);
          final user = User.fromJson(response.data['data']);
          await storage.write(key: 'username', value: user.name);
          await storage.write(key: 'email', value: user.email);
          return user;
        }
        return null;
      } catch (e) {
        print('Login failed: $e');
        return null;
      }
    }

    @override
    Future<void> logout() async {
      await storage.delete(key: 'token');
      await storage.delete(key: 'username');
      await storage.delete(key: 'email');
    }

    @override
    Future<String?> getToken() async {
      return await storage.read(key: 'token');
    }

    @override
    Future<User?> getUser() async {
      final name = await storage.read(key: 'username');
      final email = await storage.read(key: 'email');
      if (name != null && email != null) {
        return User(name: name, email: email);
      }
      return null;
    }

    @override
      Future<bool> isAuthenticated() async {
      final token = await getToken();
      return token != null;
    }
  }
