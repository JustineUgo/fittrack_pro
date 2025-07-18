import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/animated_fab.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/excercises.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/health_overview.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/workout_progress.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedFab(),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: FitColor.greyBackground(context),
                  flexibleSpace: DashboardHeader(),
                ),
                SliverToBoxAdapter(child: WorkoutProgress()),
                SliverAppBar(
                  pinned: orientation == Orientation.portrait,
                  expandedHeight: 350,
                  toolbarHeight: 350,
                  backgroundColor: FitColor.greyBackground(context),
                  flexibleSpace: HealthOverview(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: xl),
                    child: Excercises(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
