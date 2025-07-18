import 'package:fittrack_pro/core/assets/assets.dart';
import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/excercise.dart';
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
                SliverToBoxAdapter(child: SizedBox(height: m)),
                SliverToBoxAdapter(
                  child: WorkoutProgress(),
                ),

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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Excercises",
                            style: FitStyle.h6(
                              context,
                            ).copyWith(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: xs),
                          Excercise(image: Assets.sample),
                          Excercise(image: Assets.sample6, swap: true),
                          Excercise(image: Assets.sample1),
                          Excercise(image: Assets.sample4, swap: true),
                          Excercise(image: Assets.sample2),
                          Excercise(image: Assets.sample3, swap: true),
                          Excercise(image: Assets.sample5),
                        ],
                      ),
                    ),
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
