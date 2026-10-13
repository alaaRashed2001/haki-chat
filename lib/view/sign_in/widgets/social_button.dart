import 'package:flutter/material.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/extensions/app_responsive.dart';
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
      borderRadius: context.circularRadius(14),
      child: InkWell(
        borderRadius: context.circularRadius(14),
        onTap: onTap,
        child: Container(
          padding: context.spaceSymmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: context.rWidth(16),
            children: [
              Image.asset(
                image,
                width: context.rWidth(24),
                height: context.rHeight(24),
              ),
              Text(
                title,
                style: context.font16Bold!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
