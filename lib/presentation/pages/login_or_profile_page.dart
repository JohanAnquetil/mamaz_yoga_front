import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConditionalAuthPage extends StatelessWidget {
  const ConditionalAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('test');
    // print(_loginRemoteDataSource.isAuthenticated());
    // return FutureBuilder<bool>(
    //   future: _loginRemoteDataSource.isAuthenticated(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (snapshot.data == true) {
    //       return const HomePage();
    //     } else {
    //       return const LoginPage();
    //     }
    //   },
    // );
  }
}
