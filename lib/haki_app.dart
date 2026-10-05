import 'package:flutter/material.dart';
import 'package:haki/core/theme/app_theme.dart';

class HakiApp extends StatelessWidget {
  const HakiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haki',
      // home: HakiHome(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
