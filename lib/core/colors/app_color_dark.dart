import 'package:haki/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppColorDark implements AppColors {
  const AppColorDark();

  @override
  Color get primaryColor => AppColorPalette.primary;

  @override
  Color get backgroundColor => const Color(0xFF0B0F09);

  @override
  Color get cardColor => const Color(0xFF151B12);

  @override
  Color get textPrimaryColor => const Color(0xFFF4F8EE);

  @override
  Color get textSecondaryColor => const Color(0xFFB3BDAA);

  @override
  Color get textTertiaryColor => const Color(0xFF7D8875);
  @override
  Color get primaryDarkColor => const Color(0xFF78B832);

  @override
  Color get buttonDisabledColor => const Color(0xFF343B30);

  @override
  Color get buttonTextColor => const Color(0xFF17210F);

  @override
  Color get inputBackgroundColor => const Color(0xFF171D14);

  @override
  Color get inputBorderColor => const Color(0xFF30392C);

  @override
  Color get inputFocusedBorderColor => primaryColor;

  @override
  Color get inputErrorBorderColor => AppColorPalette.error;

  @override
  Color get dividerColor => const Color(0xFF293127);

  @override
  Color get successColor => AppColorPalette.success;

  @override
  Color get warningColor => AppColorPalette.warning;

  @override
  Color get errorColor => AppColorPalette.error;
}
