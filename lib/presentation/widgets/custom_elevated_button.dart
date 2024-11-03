import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppTheme.pinkColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: AppTheme.textTheme.bodySmall),
      ),
    );
  }
}
