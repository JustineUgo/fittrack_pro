import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:flutter/material.dart';

class Excercise extends StatelessWidget {
  const Excercise({super.key, required this.image, this.swap = false});
  final String image;
  final bool swap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(bottom: xs),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(FitRadius.m),
        color: FitColor.lightPurple,
        image: DecorationImage(image: AssetImage(image)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FitColor.primary(context).withValues(alpha: .7),
          borderRadius: BorderRadius.circular(FitRadius.m),
        ),
        child: Row(children: [ContentPart()]),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Squat Low\nBuild Strength",
              style: FitStyle.h6(context).copyWith(
                color: FitColor.whiteColor,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
            Text(
              "Build core strength ",
              style: FitStyle.b2(context).copyWith(
                color: FitColor.whiteColor,
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
