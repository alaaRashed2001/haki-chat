import 'package:flutter/material.dart';
import 'package:haki/core/get_it_service.dart';
import 'package:haki/core/navigations/routes_manager.dart';
import 'package:haki/core/theme/app_theme.dart';

import 'core/navigations/get_it_navigation_extension.dart';

class HakiApp extends StatelessWidget {
  const HakiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haki',
      navigatorKey: getIt.navigatorKey,
      onGenerateRoute: RoutesManager.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
