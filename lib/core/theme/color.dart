import 'package:fittrack_pro/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class FitColor {
  FitColor._();
  static MaterialColor primary(BuildContext context) => MaterialColor(
        0xFF2F0943,
        context.isDark
            ? {
                100: Color(0xFF2b1d4c),
                200: Color(0xFF3c2769),
                300: Color(0xFF4c3285),
                400: Color(0xFF5c3da2),
                500: Color(0xFF8568c6),
                600: Color(0xFF6e4bbb),
                700: Color(0xFF9d86d1),
                800: Color(0xFFb6a4dd),
                900: Color(0xFFcec3e8),
                1000: Color(0xFFe7e1f4),
              }
            : {
                100: Color(0xFFe7e1f4),
                200: Color(0xFFcec3e8),
                300: Color(0xFFb6a4dd),
                400: Color(0xFF9d86d1),
                500: Color(0xFF6e4bbb),
                600: Color(0xFF8568c6),
                700: Color(0xFF5c3da2),
                800: Color(0xFF4c3285),
                900: Color(0xFF3c2769),
                1000: Color(0xFF2b1d4c),
              },
      );

  static MaterialColor neutral(BuildContext context) => MaterialColor(
        0xFFa4a4a4,
        context.isDark
            ? {
                100: Color(0xFF1a1a1a),
                200: Color(0xFF2e2e2e),
                300: Color(0xFF424242),
                400: Color(0xFF676767),
                500: Color(0xFF8e8e8e),
                600: Color(0xFFa4a4a4),
                700: Color(0xFFbbbbbb),
                800: Color(0xFFd2d2d2),
                900: Color(0xFFe8e8e8),
                1000: Color(0xFFffffff),
              }
            : {
                100: Color(0xFFffffff),
                200: Color(0xFFe8e8e8),
                300: Color(0xFFd2d2d2),
                400: Color(0xFFbbbbbb),
                500: Color(0xFFa4a4a4),
                600: Color(0xFF8e8e8e),
                700: Color(0xFF676767),
                800: Color(0xFF424242),
                900: Color(0xFF2e2e2e),
                1000: Color(0xFF1a1a1a),
              },
      );

  static const MaterialColor green = MaterialColor(
    0xFF1fc16b,
    {
      10: Color(0xFF1fc16b),
      100: Color(0xFF84ebb4),
      200: Color(0xFF1fc16b),
    },
  );
  static const MaterialColor yellow = MaterialColor(
    0xFFdfb400,
    {
      10: Color(0xFFffdb43),
      100: Color(0xFFffdb43),
      200: Color(0xFFdfb400),
    },
  );
  static const MaterialColor red = MaterialColor(
    0xFFd00416,
    {
      10: Color(0xFFfb3748),
      100: Color(0xFFfb3748),
      200: Color(0xFFd00416),
    },
  );

  static Color accent(BuildContext context) =>
      context.isDark
          ? Color(0xFF1A1A1D)
          : Color(0xFFF7F7F7);

  static Color background(BuildContext context) =>
      context.isDark
          ? Color(0xFF0E0E10)
          : Color(0xFFFFFFFF);

  static Color greyBackground(BuildContext context) =>
      context.isDark
          ? Color(0xFF0E0E10)
          : Color(0xFFF5F5F5);

  static Color whiteColor  = Color(0xFFFFFFFF);

  static Color blackColor  = Color(0xFF000000);
}
