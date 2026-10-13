import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension GetItNavigationExtension on GetIt {
  GlobalKey<NavigatorState> get navigatorKey =>
      get<GlobalKey<NavigatorState>>();
}
