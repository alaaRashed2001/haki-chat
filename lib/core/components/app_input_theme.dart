import 'package:flutter/material.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/typography/app_text_styles.dart';

class AppInputTheme {
  static InputDecorationTheme build(AppColors colors) {
    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color),
      );
    }

    return InputDecorationTheme(
      filled: true,
      fillColor: colors.cardColor,
      isDense: true,
      contentPadding: const EdgeInsets.all(16),

      hintStyle: AppTextStyles.style(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        lineHeight: 20,
        color: colors.textSecondaryColor,
      ),

      labelStyle: AppTextStyles.style(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        lineHeight: 20,
        color: colors.textSecondaryColor,
      ),

      suffixIconColor: colors.textSecondaryColor,

      border: border(colors.inputBorderColor),
      enabledBorder: border(colors.inputBorderColor),
      focusedBorder: border(colors.inputFocusedBorderColor),
      errorBorder: border(colors.inputErrorBorderColor),
      focusedErrorBorder: border(colors.inputErrorBorderColor),
    );
  }
}