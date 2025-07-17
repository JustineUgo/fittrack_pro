
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext{
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
