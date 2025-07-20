import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/stat_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/staggered_card.dart'; // <- Import the animation wrapper

class HealthOverview extends StatelessWidget {
  const HealthOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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

            // First Row
            Row(
              children: [
                Expanded(
                  child: StaggeredCard(
                    delay: 100,
                    child: StatCard(
                      title: "Calories\nBurned",
                      value: "480",
                      emojiText: "🔥",
                    ),
                  ),
                ),
                SizedBox(width: xs),
                Expanded(
                  child: StaggeredCard(
                    delay: 200,
                    child: StatCard(
                      title: "Steps\nTaken",
                      value: "6200",
                      emojiText: "🏃",
                      unit: "Km",
                    ),
                  ),
                ),
              ],
            ),

            // Second Row
            Row(
              children: [
                Expanded(
                  child: StaggeredCard(
                    delay: 300,
                    child: StatCard(
                      title: "Total\nSessions",
                      value: "480",
                      emojiText: "🏋🏽",
                      unit: '',
                    ),
                  ),
                ),
                SizedBox(width: xs),
                Expanded(
                  child: StaggeredCard(
                    delay: 400,
                    child: StatCard(
                      title: "Sleep\nQuality",
                      value: "7.5",
                      emojiText: "🛏️",
                      unit: "Hrs",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
