import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get textSecondaryColor =>
      Theme.of(this).colorScheme.onSurfaceVariant;

  Color get progressIndicatorColor =>
      Theme.of(this).colorScheme.tertiary;
}
