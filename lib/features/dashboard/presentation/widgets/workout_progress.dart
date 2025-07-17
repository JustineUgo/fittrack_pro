import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:flutter/material.dart';

class WorkoutProgress extends StatelessWidget {
  const WorkoutProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: EdgeInsets.symmetric(horizontal: xl),
                    padding: EdgeInsets.all(xl),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(FitRadius.s),
                      color: FitColor.primary(context),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Workout\nProgress",
                              style: FitStyle.h6(context).copyWith(
                                color: FitColor.whiteColor,
                                height: 1.1,
                              ),
                            ),
                            Text(
                              "14 Excercise Left",
                              style: FitStyle.b3(
                                context,
                              ).copyWith(color: FitColor.whiteColor),
                            ),
                          ],
                        ),
                        CircularProgressIndicator(
                          strokeWidth: 6,
                          value: .4,
                          backgroundColor: FitColor.primary(context).shade200,
                          color: FitColor.yellow,
                          constraints: BoxConstraints(
                            minWidth: 90,
                            minHeight: 90,
                          ),
                        ),
                      ],
                    ),
                  );
  }
}