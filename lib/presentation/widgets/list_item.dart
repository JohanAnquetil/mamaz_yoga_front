import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mamaz_yoga/presentation/theme/app_theme.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_network_image.dart';

class ListItem extends StatelessWidget {
  final DateTime date;
  final String image;
  final String title;

  const ListItem({
    super.key,
    required this.date,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            DateFormat('d MMMM yyyy').format(date),
            style: AppTheme.textTheme.bodySmall,
          ),
          const Divider(),
          CustomNetworkImage(imagePath: image),
          Container(
            padding: const EdgeInsets.only(bottom: 7, right: 7, left: 7),
            color: AppTheme.pinkColor,
            child: Text(title, style: AppTheme.textTheme.bodySmall),
          ),
          const SizedBox(height: 3.0),
        ],
      ),
    );
  }
}
