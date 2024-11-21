import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/presentation/blocs/splash/splash_cubit.dart';
import 'package:mamaz_yoga/presentation/blocs/splash/splash_state.dart';
import 'package:mamaz_yoga/presentation/theme/app_theme.dart';
import '../routes/routes.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  static const route = '/';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          print('UnAuthenticated');
          AutoRouter.of(context).push(const LoginRoute());
        }
        if (state is Authenticated) {
          print('Authenticated');
          AutoRouter.of(context).push(const HomeRoute());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/logo.png'),
                Image.asset('assets/images/home_page_image.png',
                    width: screenWidth),
                Text("Mama’z Yoga", style: AppTheme.textTheme.titleLarge),
                Text("Bienvenue sur l’application de yoga dédiée aux mamas !",
                    style: AppTheme.textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                // CustomElevatedButton(
                //   onPressed: () {
                //     context.read<SplashCubit>().appStarted();
                //   },
                //   text: 'Commencer',
                //   width: MediaQuery.of(context).size.width,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
