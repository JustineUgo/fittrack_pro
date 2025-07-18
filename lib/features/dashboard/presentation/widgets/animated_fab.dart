import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/features/dashboard/presentation/bloc/theme_mode/theme_mode_bloc.dart';
import 'package:fittrack_pro/features/dashboard/presentation/bloc/theme_mode/theme_mode_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedFab extends StatefulWidget {
  const AnimatedFab({super.key});

  @override
  State<AnimatedFab> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  void toggleFab() {
    HapticFeedback.vibrate();
    setState(() {
      isOpen = !isOpen;
      isOpen ? _controller.forward() : _controller.reverse();
    });
  }

  void toggleTheme(bool dark) {
    HapticFeedback.vibrate();
    setState(() {});
    toggleFab();
    BlocProvider.of<ThemeModeBloc>(
      context,
    ).add(dark ? SetDarkMode() : SetLightMode());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Light Mode Button
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: isOpen ? 60 : 20,
            right: isOpen ? 90 : 20,
            child: Visibility(
              visible: isOpen,
              child: FloatingActionButton.small(
                heroTag: 'light',
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(FitRadius.full),
                ),
                onPressed: () => toggleTheme(false),
                child: Icon(Icons.light_mode),
              ),
            ),
          ),

          // Dark Mode Button
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: isOpen ? 60 : 20,
            right: isOpen ? 0 : 20,
            child: Visibility(
              visible: isOpen,
              child: FloatingActionButton.small(
                heroTag: 'dark',
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(FitRadius.full),
                ),
                onPressed: () => toggleTheme(true),
                child: Icon(Icons.dark_mode),
              ),
            ),
          ),

          // Main FAB
          Positioned(
            bottom: 20,
            right: 40,
            child: FloatingActionButton(
              heroTag: 'main',
              onPressed: toggleFab,
              backgroundColor: FitColor.primary(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(FitRadius.full),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Icon(
                  isOpen ? Icons.close : Icons.cloud,
                  color: FitColor.whiteColor,
                  key: ValueKey<bool>(isOpen),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
