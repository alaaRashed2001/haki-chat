import 'package:flutter/material.dart';
import 'package:haki/core/service/get_it_service.dart';
import 'package:haki/haki_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const HakiApp());
}
