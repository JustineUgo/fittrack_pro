import 'package:fittrack_pro/core/route/router.dart';
import 'package:fittrack_pro/core/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  widgetsBinding;
  runApp(const FitTrackPro());
}

class FitTrackPro extends StatelessWidget {
  const FitTrackPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FitTrack Pro',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: FitTheme.themeData,
      darkTheme: FitTheme.darkThemeData,
      routerConfig: router,
    );
  }
}
