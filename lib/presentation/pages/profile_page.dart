import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_app_bar.dart';
import '../routes/routes.gr.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  static const route = '/profile';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logout(BuildContext context) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    if (!mounted) return;
    // ignore: use_build_context_synchronously
    AutoRouter.of(context).push(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'MON PROFIL', leading: true),
      body: Text('Mon profil'),
    );
    //   body: FutureBuilder<User?>(
    //        future: getIt<LoginRemoteDataSource>().getUser(),
    //        builder: (context, snapshot) {
    //          if (snapshot.connectionState == ConnectionState.waiting) {
    //            return const Center(child: CircularProgressIndicator());
    //          } else if (snapshot.hasData) {
    //            final user = snapshot.data!;
    //            return Padding(
    //              padding: const EdgeInsets.all(8.0),
    //              child: Column(
    //                children: [
    //                  const Center(
    //                    child: CircleAvatar(
    //                      radius: 70,
    //                      foregroundImage: AssetImage(
    //                          'assets/images/avatar.png'),
    //                    ),
    //                  ),
    //                  Text(
    //                    user.name,
    //                  ),
    //                  Text(user.email),
    //                  const SizedBox(height: 30),
    //                  ElevatedButton(
    //                    onPressed: () => _logout(context),
    //                    child: const Text('Se Déconnecter'),
    //                  ),
    //                ],
    //              ),
    //            );
    //          } else {
    //            return Container();
    //          }
    //    },
    //   ),
    // );
  }
}
