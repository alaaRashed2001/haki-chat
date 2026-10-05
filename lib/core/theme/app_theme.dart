import 'package:flutter/material.dart';
import 'package:haki/core/theme/dark_theme.dart';
import 'package:haki/core/theme/light_theme.dart';

class AppTheme {
  static ThemeData get light => LightTheme.build();

  static ThemeData get dark => DarkTheme.build();
}