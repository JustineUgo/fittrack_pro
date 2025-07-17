import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key, required this.tag});
  final String tag;
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Hero(
          tag: widget.tag,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.tag)),
            ),
          ),
        ),
      ),
    );
  }
}
