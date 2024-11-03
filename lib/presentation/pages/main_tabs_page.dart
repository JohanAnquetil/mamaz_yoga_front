  import 'package:auto_route/auto_route.dart';
  import 'package:flutter/material.dart';
  import '../routes/routes.gr.dart';
  import '../widgets/custom_bottom_navigation_bar.dart';

  @RoutePage()
  class MainTabsPage extends StatelessWidget {
    static const route = '/main';

    const MainTabsPage({super.key});

    @override
    Widget build(BuildContext context) {
      return AutoTabsRouter(
        routes: [
          const HomeRoute(),
          const ArticlesRoute(),
          VideosRoute(),
           const HistoryRoute(),
          ConditionalAuthRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
            ),
          );
        },
      );
    }
  }
