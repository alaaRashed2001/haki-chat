import 'package:flutter/material.dart';
import 'package:haki/core/navigations/unknown_route_screen.dart';
import 'package:haki/view/auth/sign_in.dart';
import 'package:haki/view/auth/sign_up.dart';
import 'package:haki/view/splash/custom_splash_screen.dart';

class RoutesManager {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget widget;
    String? name = settings.name;
    if (name == RouteName.customSplash.title) {
      widget = const CustomSplashScreen();
    } else if (name == RouteName.signIn.title) {
      widget = const SignIn();
    } else if (name == RouteName.signUp.title) {
      widget = const SignUp();
    } else {
      widget = UnknownRouteScreen(routeName: name ?? '');
    }
    return MaterialPageRoute(settings: settings, builder: (context) => widget);
  }
}

enum RouteName {
  signIn('/sign_in'),
  messagesPage('/messages_page'),
  customSplash('/'),
  signUp('/sign_up');

  final String title;

  const RouteName(this.title);
}
