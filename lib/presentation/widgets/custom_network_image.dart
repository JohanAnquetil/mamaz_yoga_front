import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imagePath;
  final double? width;

  const CustomNetworkImage({super.key, this.imagePath, this.width});

  @override
  Widget build(BuildContext context) {
    return imagePath != null
        ? Image.network(
            imagePath!,
            width: width,
            height: 200,
            fit: BoxFit.fitWidth,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/home_page_image.png');
            },
          )
        : Image.asset('assets/images/home_page_image.png');
  }
}
