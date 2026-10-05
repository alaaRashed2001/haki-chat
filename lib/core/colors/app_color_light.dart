import 'package:flutter/material.dart';
import 'package:haki/core/colors/app_colors.dart';

class AppColorLight implements AppColors {
  const AppColorLight();

  @override
  Color get primaryColor => AppColorPalette.primary;

  @override
  Color get backgroundColor => const Color(0xFFF8FAF5);

  @override
  Color get cardColor => const Color(0xFFFFFFFF);

  @override
  Color get textPrimaryColor => const Color(0xFF17210F);

  @override
  Color get textSecondaryColor => const Color(0xFF65705C);

  @override
  Color get textTertiaryColor => const Color(0xFF929B8A);
  @override
  Color get primaryDarkColor => const Color(0xFF82C63A);

  @override
  Color get buttonDisabledColor => const Color(0xFFE1E6DC);

  @override
  Color get buttonTextColor => const Color(0xFF17210F);

  @override
  Color get inputBackgroundColor => const Color(0xFFF3F6EF);

  @override
  Color get inputBorderColor => const Color(0xFFDCE3D5);

  @override
  Color get inputFocusedBorderColor => primaryColor;

  @override
  Color get inputErrorBorderColor => AppColorPalette.error;

  @override
  Color get dividerColor => const Color(0xFFE7EBE2);

  @override
  Color get successColor => AppColorPalette.success;

  @override
  Color get warningColor => AppColorPalette.warning;

  @override
  Color get errorColor => AppColorPalette.error;
}
