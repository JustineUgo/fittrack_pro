import 'package:fittrack_pro/core/assets/assets.dart';
import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/excercise.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/stat_card.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/workout_progress.dart';
import 'package:flutter/cupertino.dart';
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
                  flexibleSpace: Padding(
                    padding: EdgeInsets.symmetric(horizontal: xl),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'intro',
                          child: Container(
                            height: 50,
                            width: 50,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(Assets.rootImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: s),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Hi 👋", style: FitStyle.h5(context)),
                              Text(
                                "Thursday, 17th July",
                                style: FitStyle.b4(context),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          padding: EdgeInsets.all(xs),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FitColor.neutral(
                              context,
                            ).shade200.withValues(alpha: .5),
                          ),
                          child: Icon(CupertinoIcons.moon_fill),
                        ),
                      ],
                    ),
                  ),
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
                  flexibleSpace: Padding(
                    padding: EdgeInsets.symmetric(horizontal: xl, vertical: s),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Health Overview",
                            style: FitStyle.h6(
                              context,
                            ).copyWith(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(height: xs),
                          Row(
                            children: [
                              StatCard(
                                title: "Calories\nBurned",
                                value: "480",
                                emojiText: "🔥",
                              ),
                              SizedBox(width: xs),
                              StatCard(
                                title: "Steps\nTaken",
                                value: "6200",
                                emojiText: "🏃",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              StatCard(
                                title: "Total\nSessions",
                                value: "480",
                                emojiText: "🏋🏽",
                              ),
                              SizedBox(width: xs),
                              StatCard(
                                title: "Sleep\nQuality",
                                value: "7,5",
                                emojiText: "🛏️",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
