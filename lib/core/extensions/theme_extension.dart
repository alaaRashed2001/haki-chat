import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get textSecondaryColor =>
      Theme.of(this).colorScheme.onSurfaceVariant;
}
