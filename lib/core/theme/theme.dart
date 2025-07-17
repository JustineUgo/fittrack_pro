import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FitTheme {
  static ThemeData themeData = ThemeData(
      disabledColor: Color(0xFFcec3e8),
      fontFamily: 'archivo',
      brightness: Brightness.light,
      primaryColor: Color(0xFF2F0943),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF2F0943),
        secondary: const Color(0xFFa4a4a4),
        error: const Color(0xFFd00416),
        surface: const Color(0xFFFFFFFF),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Color(0xFF2F0943),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontFamily: 'archivo',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFFa4a4a4),
        ),
        filled: true,
        fillColor: const Color(0xFFF7F7F7),
        contentPadding: EdgeInsets.only(top: m, bottom: m, left: m, right: s),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: const BorderSide(color: FitColor.red)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: BorderSide(color: Color(0xFF6e4bbb))),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: const BorderSide(color: FitColor.red)),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: WidgetStateProperty.all(Color(0xFF2F0943)),
          foregroundColor: WidgetStateProperty.all(Color(0xFFffffff)),
          iconSize: WidgetStateProperty.all(16),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: s, horizontal: m)),
          minimumSize: WidgetStateProperty.all(const Size(52, 44)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.comfortable,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FitRadius.s)),
        side: BorderSide(width: 1, color: Color(0xFFe8e8e8)),
        checkColor: const WidgetStatePropertyAll(Color(0xFFFFFFFF)),
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Color(0xFF6e4bbb);
          }
          return const Color(0xFFFFFFFF);
        }),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 44)),
          textStyle: WidgetStateProperty.all(TextStyle(
            fontFamily: 'archivo',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0,
            height: 1,
            color: Color(0xFFFFFFFF),
          ).copyWith(color: Color(0xFFe8e8e8))),
          foregroundColor: WidgetStateProperty.all(Color(0xFFe8e8e8)),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color(0xFFFFFFFF);
            }
            return const Color(0xFFFFFFFF);
          }),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: s, horizontal: m)),
          shape: WidgetStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(FitRadius.s)))),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 44)),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              fontFamily: 'archivo',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0,
              height: 1,
              color: Color(0xFFFFFFFF),
            ),
          ),
          foregroundColor: WidgetStateProperty.all(Color(0xFFffffff)),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Color(0xFFcec3e8);
            }
            return Color(0xFF2F0943);
          }),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: s, horizontal: m)),
          shape: WidgetStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(FitRadius.s)))),
        ),
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Color(0xFFFFFFFF)),
      radioTheme: RadioThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Color(0xFF6e4bbb);
          }
          return Color(0xFFe8e8e8);
        }),
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStatePropertyAll(Color(0xFF6e4bbb)),
        thumbColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
      ),
      dividerTheme: DividerThemeData(
        space: 1,
      ));

  static ThemeData darkThemeData = ThemeData(
      disabledColor: Color(0xFF3c2769),
      fontFamily: 'archivo',
      brightness: Brightness.dark,
      primaryColor: Color(0xFF2F0943),
      scaffoldBackgroundColor: const Color(0xFF0E0E10),
      appBarTheme: AppBarTheme(
        surfaceTintColor: const Color(0xFF0E0E10),
        backgroundColor: const Color(0xFF0E0E10),
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color(0xFF2F0943),
        secondary: const Color(0xFFa4a4a4),
        error: const Color(0xFFd00416),
        surface: const Color(0xFF0E0E10),
        brightness: Brightness.dark,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: const Color(0xFF0E0E10),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Color(0xFFFFFFFF),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontFamily: 'archivo',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF8e8e8e),
        ),
        filled: true,
        fillColor: Color(0xFF1A1A1D),
        contentPadding: EdgeInsets.only(top: m, bottom: m, left: m, right: s),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: const BorderSide(color: FitColor.red)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FitRadius.m),
          borderSide: BorderSide(
            color: Color(0xFF8568c6),
          ),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(FitRadius.m),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FitRadius.m),
          borderSide: const BorderSide(color: FitColor.red),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: WidgetStateProperty.all(Color(0xFF2F0943)),
          foregroundColor: WidgetStateProperty.all(Color(0xFF1a1a1a)),
          iconSize: WidgetStateProperty.all(16),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: s, horizontal: m)),
          minimumSize: WidgetStateProperty.all(const Size(52, 44)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.comfortable,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FitRadius.s)),
        side: BorderSide(width: 1, color: Color(0xFF2e2e2e)),
        checkColor: const WidgetStatePropertyAll(Color(0xFFFFFFFF)),
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Color(0xFF8568c6);
          }
          return Color(0xFFffffff);
        }),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 44)),
          textStyle: WidgetStateProperty.all(TextStyle(
            fontFamily: 'archivo',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0,
            height: 1,
            color: Color(0xFF1a1a1a),
          ).copyWith(color: Color(0xFF2e2e2e))),
          foregroundColor: WidgetStateProperty.all(Color(0xFF2e2e2e)),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return const Color(0xFF0E0E10);
            }
            return const Color(0xFF0E0E10);
          }),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: s, horizontal: m)),
          shape: WidgetStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(FitRadius.s)))),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 44)),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              fontFamily: 'archivo',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0,
              height: 1,
              color: Color(0xFFFFFFFF),
            ),
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Color(0xFF2B1D4C);
            }
            return Color(0xFFFFFFFF);
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Color(0xFF3c2769);
            }
            return Color(0xFF2F0943);
          }),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: s, horizontal: m)),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(FitRadius.s),
              ),
            ),
          ),
        ),
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Color(0xFFFFFFFF)),
      radioTheme: RadioThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Color(0xFF8568c6);
          }
          return Color(0xFF2e2e2e);
        }),
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStatePropertyAll(Color(0xFF8568c6)),
        thumbColor: WidgetStatePropertyAll(Color(0xFF1A1A1A)),
        thumbIcon: WidgetStatePropertyAll(
          Icon(CupertinoIcons.circle_fill, color: Color(0xFF1A1A1A)),
        ),
      ),
      dividerTheme: DividerThemeData(
        space: 1,
      ));
}
