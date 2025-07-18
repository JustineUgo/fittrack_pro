import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  const AnimatedFab({super.key});

  @override
  State<AnimatedFab> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  bool isDark = false;

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide1;
  late Animation<Offset> _slide2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide1 = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -1.5),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _slide2 = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -2.5),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  void toggleFab() {
    setState(() {
      isOpen = !isOpen;
      isOpen ? _controller.forward() : _controller.reverse();
    });
  }

  void toggleTheme(bool dark) {
    setState(() {
      isDark = dark;
    });
    toggleFab();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Dark Mode Button
        SlideTransition(
          position: _slide2,
          child: FadeTransition(
            opacity: _fade,
            child: FloatingActionButton(
              heroTag: 'dark',
              mini: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(FitRadius.full),
              ),
              onPressed: () => toggleTheme(true),
              child: Icon(CupertinoIcons.moon_fill),
            ),
          ),
        ),

        // Light Mode Button
        SlideTransition(
          position: _slide1,
          child: FadeTransition(
            opacity: _fade,
            child: FloatingActionButton(
              heroTag: 'light',
              mini: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(FitRadius.full),
              ),
              onPressed: () => toggleTheme(false),
              child: Icon(CupertinoIcons.sun_max_fill),
            ),
          ),
        ),

        // Main FAB
        FloatingActionButton(
          heroTag: 'main',
          onPressed: toggleFab,
          backgroundColor: FitColor.primary(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(FitRadius.full),
          ),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: Icon(
              isOpen ? Icons.close : CupertinoIcons.circle,
              key: ValueKey<bool>(isOpen),
            ),
          ),
        ),
      ],
    );
  }
}
