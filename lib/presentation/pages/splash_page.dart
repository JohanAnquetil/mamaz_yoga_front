import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mamaz_yoga/presentation/theme/app_theme.dart';
import '../routes/routes.gr.dart';
import '../widgets/custom_elevated_button.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  static const route = '/';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
              CustomElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(
                    ConditionalAuthRoute(),
                  );
                },
                text: 'Commencer',
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
