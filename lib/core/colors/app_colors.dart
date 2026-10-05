import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primaryColor;

  Color get backgroundColor;
  Color get cardColor;

  Color get textPrimaryColor;
  Color get textSecondaryColor;
  Color get textTertiaryColor;

  Color get primaryDarkColor;
  Color get buttonDisabledColor;
  Color get buttonTextColor;

  Color get inputBackgroundColor;
  Color get inputBorderColor;
  Color get inputFocusedBorderColor;
  Color get inputErrorBorderColor;

  Color get dividerColor;

  Color get successColor;
  Color get warningColor;
  Color get errorColor;
}

// ============================================================
// Shared
// ============================================================

abstract final class AppColorPalette {
  static const primary = Color(0xFFC2F158);

  // Primary variations
  static const primaryDark = Color(0xFFA8D83F);
  static const primaryLight = Color(0xFFD9F88A);

  // Semantic
  static const success = Color(0xFF4ADE80);
  static const warning = Color(0xFFFBBF24);
  static const error = Color(0xFFF87171);
}
