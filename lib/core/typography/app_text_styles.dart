import 'package:flutter/material.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/typography/font_weight.dart';

class AppTextStyles {
  static const String defaultFont = '';

  static TextStyle style({
    required double fontSize,
    required FontWeight fontWeight,
    required double lineHeight,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: defaultFont,
      height: lineHeight / fontSize,
    );
  }

  static TextTheme textTheme(AppColors colors) {
    TextStyle create(double size, FontWeight weight, double lineHeight) {
      return style(
        fontSize: size,
        fontWeight: weight,
        lineHeight: lineHeight,
        color: colors.textPrimaryColor,
      );
    }

    return TextTheme(
      displayLarge: create(34, FontWeightHelper.bold, 40),
      displayMedium: create(34, FontWeightHelper.regular, 40),

      displaySmall: create(28, FontWeightHelper.bold, 32),
      headlineLarge: create(28, FontWeightHelper.regular, 32),

      headlineMedium: create(26, FontWeightHelper.bold, 30),
      headlineSmall: create(26, FontWeightHelper.regular, 30),

      titleLarge: create(22, FontWeightHelper.bold, 28),
      titleMedium: create(22, FontWeightHelper.regular, 28),

      titleSmall: create(18, FontWeightHelper.bold, 24),
      bodyLarge: create(18, FontWeightHelper.regular, 24),

      bodyMedium: create(16, FontWeightHelper.bold, 24),
      bodySmall: create(16, FontWeightHelper.regular, 24),

      labelLarge: create(14, FontWeightHelper.bold, 20),
      labelMedium: create(14, FontWeightHelper.regular, 20),
    );
  }
}
