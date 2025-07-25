import 'package:fittrack_pro/core/assets/assets.dart';
import 'package:fittrack_pro/core/route/router.dart';
import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Excercises extends StatelessWidget {
  const Excercises({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    );
  }
}

class Excercise extends StatelessWidget {
  const Excercise({super.key, required this.image, this.swap = false});
  final String image;
  final bool swap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RoutePath.workout, extra: image),
      child: Container(
        height: 180,
        margin: EdgeInsets.only(bottom: xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FitRadius.m),
          // color: FitColor.whiteColor,
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              FitColor.primary(context).shade200,
              FitColor.background(context),
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Hero(tag: image, child: Image.asset(image)),
            ),
            ContentPart(),
          ],
        ),
      ),
    );
  }
}

class ImagePart extends StatelessWidget {
  const ImagePart({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.fromLTRB(0, 0, s, 0),
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}

class ContentPart extends StatelessWidget {
  const ContentPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(s),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Squat Low\nBuild Strength",
              textAlign: TextAlign.end,
              style: FitStyle.h6(context).copyWith(
                // color: FitColor.whiteColor,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
            Text(
              "Build core strength ",
              style: FitStyle.b2(context).copyWith(
                // color: FitColor.whiteColor,
                fontWeight: FontWeight.w300,
                height: 1.3,
              ),
            ),
            SizedBox(height: l),
            Container(
              padding: EdgeInsets.symmetric(horizontal: m, vertical: xs),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(FitRadius.full),
                color: FitColor.blackColor.withValues(alpha: .9),
              ),
              child: Text(
                "Start Now",
                style: FitStyle.b2(
                  context,
                ).copyWith(color: FitColor.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
