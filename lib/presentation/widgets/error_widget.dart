import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'custom_elevated_button.dart';

class ErrorWidgetWithRetry extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const ErrorWidgetWithRetry({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage, style: AppTheme.textTheme.bodyMedium),
          const SizedBox(height: 16),
          CustomElevatedButton(
            onPressed: onRetry,
            text: 'Réessayer',
          ),
        ],
      ),
    );
  }
}