import 'package:flutter/material.dart';

extension TextEditingControllerExtensions on TextEditingController {
  String get getText => text.trim();
}
