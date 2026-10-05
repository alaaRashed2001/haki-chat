import 'package:flutter/material.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/typography/app_text_styles.dart';
import 'package:haki/core/typography/font_weight.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData elevated(AppColors colors) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
        maximumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
        elevation: const WidgetStatePropertyAll(0),

        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        ),

        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),

        foregroundColor: WidgetStatePropertyAll(colors.buttonTextColor),

        textStyle: WidgetStatePropertyAll(
          AppTextStyles.style(
            fontSize: 16,
            fontWeight: FontWeightHelper.medium,
            lineHeight: 16,
            color: colors.buttonTextColor,
          ),
        ),

        backgroundBuilder: (context, states, child) {
          final disabled = states.contains(WidgetState.disabled);

          final pressed = states.contains(WidgetState.pressed);

          return DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: disabled
                    ? [colors.buttonDisabledColor, colors.buttonDisabledColor]
                    : pressed
                    ? [colors.primaryDarkColor, colors.primaryDarkColor]
                    : [colors.primaryColor, colors.primaryDarkColor],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
