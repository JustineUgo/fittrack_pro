import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.emojiText,
  });
  final String title;
  final String value;
  final String emojiText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: xs),
        padding: EdgeInsets.all(s),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FitRadius.m),
          color: FitColor.background(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,

                  style: FitStyle.b1(context).copyWith(height: 1.2),
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.all(s),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: FitColor.neutral(
                      context,
                    ).shade200.withValues(alpha: .3),
                  ),
                  child: Text(emojiText, style: FitStyle.h5(context)),
                ),
              ],
            ),
            SizedBox(height: xs3),
            RichText(
              text: TextSpan(
                text: value,
                style: FitStyle.h4(context),
                children: [
                  TextSpan(text: "  kcal", style: FitStyle.b1(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
