import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading;

  const CustomAppBar({super.key, required this.title, this.leading = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      title: Container(
        padding: const EdgeInsets.all(7.0),
        color: AppTheme.pinkColor,
        child: Text(
          title,
          style: AppTheme.textTheme.titleMedium,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
