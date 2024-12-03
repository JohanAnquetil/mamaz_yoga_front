import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/init_config.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_event.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_state.dart';
import 'package:mamaz_yoga/presentation/blocs/user/user_status.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_app_bar.dart';

// @RoutePage()
// class HomePage extends StatelessWidget {
//   static const route = '/home';
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => getIt<UserBloc>()..add(UserLoaded()),
//         child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
//           //String name = state.user.displayName;
//           if (state.status == UserStatus.loading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state.status == UserStatus.authenticated) {
//             return Center(
//               child: Text('Welcome name'),
//             );
//           } else {
//             return const Center(
//               child: Text('Unexpected state.'),
//             );
//           }
//         }));
//   }
// }

@RoutePage()
class HomePage extends StatelessWidget {
  static const route = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          print("state: $state");
          if (state.status == UserStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == UserStatus.authenticated) {
            return Center(
              child: Text('Welcome ${state.user.displayName}'),
            );
          }

          if (state.status == UserStatus.unauthenticated) {
            return const Center(
              child: Text('Please log in to continue.'),
            );
          }

          if (state.status == UserStatus.error) {
            return Center(
              child: Text(
                  'An error occurred: ${state.errorMessage ?? 'Unknown error'}'),
            );
          }

          // État inattendu (optionnel, pour le débogage)
          return const Center(
            child: Text('Unexpected state.'),
          );
        },
      ),
    );
  }
}
