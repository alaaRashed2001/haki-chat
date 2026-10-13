import 'package:flutter/material.dart';
import 'package:haki/core/navigations/routes_manager.dart';

class AppNavigation {
  const AppNavigation._();

  static Future<T?> pushNamed<T extends Object?>({
    required BuildContext context,
    required RouteName routeName,
    ArgumentsModel? arguments,
  }) {
    return Navigator.pushNamed<T>(
      context,
      routeName.title,
      arguments: arguments,
    );
  }

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>({
    required BuildContext context,
    required RouteName routeName,
    ArgumentsModel? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      context,
      routeName.title,
          (route) => false,
      arguments: arguments,
    );
  }

  static void pop<T extends Object?>({
    required BuildContext context,
  }) {
    return Navigator.pop<T>(context);
  }
}

class ArgumentsModel {
  final String? comeFrom;
  final String? goToAfterBack;

  const ArgumentsModel({this.comeFrom, this.goToAfterBack});
}