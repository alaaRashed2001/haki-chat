import 'package:flutter/material.dart';
import 'package:haki/core/navigations/app_navigation.dart';
import 'package:haki/core/navigations/routes_manager.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppNavigation.pushNamedAndRemoveUntil(
        context: context,
        routeName:  RouteName.signIn

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Custom Splash Screen')));
  }
}