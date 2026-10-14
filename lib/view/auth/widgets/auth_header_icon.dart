import 'package:flutter/material.dart';
import 'package:haki/core/colors/app_colors.dart';
import 'package:haki/core/extensions/app_responsive.dart';

class AuthHeaderIcon extends StatelessWidget {
  const AuthHeaderIcon({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.spaceAll(10),
      decoration: BoxDecoration(
        color: AppColorPalette.primary,
        borderRadius: context.circularRadius(26),
      ),
      child: Image.asset(image),
    );
  }
}
