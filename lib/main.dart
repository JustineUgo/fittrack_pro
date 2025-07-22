import 'package:fittrack_pro/core/route/router.dart';
import 'package:fittrack_pro/core/services/storage_service.dart';
import 'package:fittrack_pro/core/services/workout_service.dart';
import 'package:fittrack_pro/core/theme/theme.dart';
import 'package:fittrack_pro/features/dashboard/presentation/bloc/theme_mode/theme_mode_bloc.dart';
import 'package:fittrack_pro/features/dashboard/presentation/bloc/theme_mode/theme_mode_state.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  widgetsBinding;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(FitTrackPro(sharedPreferences: sharedPreferences));
}

class FitTrackPro extends StatelessWidget {
  const FitTrackPro({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeModeBloc(
            storage: SharedPreferenceService(sharedPreferences),
          ),
        ),
        BlocProvider(
          create: (_) => WorkoutBloc(
            WorkoutService(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'FitTrack Pro',
            debugShowCheckedModeBanner: false,
            themeMode: state is SystemMode
                ? ThemeMode.system
                : (state is LightMode ? ThemeMode.light : ThemeMode.dark),

            theme: FitTheme.themeData,
            darkTheme: FitTheme.darkThemeData,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
