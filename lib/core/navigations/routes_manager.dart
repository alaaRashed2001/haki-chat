import 'package:flutter/material.dart';
import 'package:haki/core/navigations/unknown_route_screen.dart';
import 'package:haki/view/sign_in/sign_in.dart';
import 'package:haki/view/splash_screen/custom_splash_screen.dart';

class RoutesManager {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget widget;
    String? name = settings.name;
    if (name == RouteName.customSplash.title) {
      widget = const CustomSplashScreen();
    } else if (name == RouteName.signIn.title) {
      widget = const SignIn();
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
