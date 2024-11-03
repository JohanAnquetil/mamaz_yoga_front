import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mamaz_yoga/presentation/theme/app_theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  static const List<BottomNavigationBarItem> defaultItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "Accueil",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.news),
      label: "News",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.video_camera),
      label: "Vidéos",
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.time), label: "Historique"),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: "Compte",
    ),
  ];

  final List<BottomNavigationBarItem> items;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    this.items = defaultItems,
    this.selectedItemColor,
    this.unselectedItemColor,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    return BottomNavigationBar(
      items: items,
      selectedItemColor: selectedItemColor ?? AppTheme.redColor,
      unselectedItemColor: unselectedItemColor ?? AppTheme.lightGreyColor,
      type: BottomNavigationBarType.fixed,
      elevation: 2,
      currentIndex: currentIndex,
      onTap: (index) => _goToPage(index, tabsRouter),
    );
  }

  void _goToPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
