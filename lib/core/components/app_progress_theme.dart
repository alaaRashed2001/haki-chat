import 'package:flutter/material.dart';
import 'package:haki/core/extensions/app_responsive.dart';
import 'package:haki/core/extensions/theme_extension.dart';
import 'package:haki/widgets/app_loading_indicator.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final indicatorSize = context.rWidth(AppProgressTheme.size);

    return SizedBox(
      width: indicatorSize,
      height: indicatorSize,
      child: CircularProgressIndicator(
        strokeWidth: context.rWidth(AppProgressTheme.strokeWidth),
        color: context.progressIndicatorColor,
      ),
    );
  }
}
