import 'package:flutter/material.dart';
import 'package:haki/core/get_it_service.dart';
import 'package:haki/haki_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(const HakiApp());
}
