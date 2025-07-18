import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:fittrack_pro/features/dashboard/presentation/widgets/stat_card.dart';
import 'package:flutter/cupertino.dart';

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
                  );
  }
}