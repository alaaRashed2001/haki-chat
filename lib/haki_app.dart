import 'package:flutter/material.dart';
import 'package:haki/core/extensions/get_it_extensions.dart';
import 'package:haki/core/navigations/routes_manager.dart';
import 'package:haki/core/service/get_it_service.dart';
import 'package:haki/core/theme/app_theme.dart';

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
