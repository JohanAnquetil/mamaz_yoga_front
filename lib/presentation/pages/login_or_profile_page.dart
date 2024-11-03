import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mamaz_yoga/presentation/pages/profile_page.dart';
import '../../data/data_sources/remote/login/login_remote_data_source.dart';
import '../../init_config.dart';
import 'login_page.dart';

@RoutePage()
class ConditionalAuthPage extends StatelessWidget {
  ConditionalAuthPage({super.key});
  final LoginRemoteDataSource _loginRemoteDataSource =
      getIt<LoginRemoteDataSource>();
  @override
  Widget build(BuildContext context) {
    print(_loginRemoteDataSource.isAuthenticated());
    return FutureBuilder<bool>(
      future: _loginRemoteDataSource.isAuthenticated(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data == true) {
          return const ProfilePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
