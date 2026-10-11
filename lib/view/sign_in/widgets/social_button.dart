import 'package:flutter/material.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/extensions/opacity_of_color.dart';
import 'package:haki/core/extensions/text_style_extension.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColorPalette.primary.changeOpacity(30),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Image.asset(image, width: 24, height: 24),
              Text(title, style: context.font16Bold!),
            ],
          ),
        ),
      ),
    );
  }
}
