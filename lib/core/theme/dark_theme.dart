import 'package:flutter/material.dart';
import 'package:haki/core/colors/app_color_dark.dart';
import 'package:haki/core/components/app_button_theme.dart';
import 'package:haki/core/components/app_input_theme.dart';
import 'package:haki/core/typography/app_text_styles.dart';

class DarkTheme {
  static ThemeData build() {
    const colors = AppColorDark();

    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.defaultFont,

      primaryColor: colors.primaryColor,

      scaffoldBackgroundColor: colors.backgroundColor,
      cardColor: colors.cardColor,

      colorScheme: ColorScheme.dark(
        primary: colors.primaryColor,
        surface: colors.cardColor,
        onSurface: colors.textPrimaryColor,
        onSurfaceVariant: colors.textSecondaryColor,
      ),

      textTheme: AppTextStyles.textTheme(colors),

      elevatedButtonTheme: AppButtonTheme.elevated(colors),

      inputDecorationTheme: AppInputTheme.build(colors),
    );
  }
}
