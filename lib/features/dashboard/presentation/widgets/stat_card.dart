import 'package:flutter/material.dart';
import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';

class StatCard extends StatefulWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.emojiText,
    this.unit = 'kcal', // optional unit suffix
  });

  final String title;
  final String value;
  final String emojiText;
  final String unit;

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _countAnimation;

  @override
  void initState() {
    super.initState();

    double endValue = double.tryParse(widget.value.replaceAll(",", "")) ?? 0;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _countAnimation = Tween<double>(begin: 0, end: endValue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatValue(double value) {
    // Add comma for thousands, preserve decimals if any
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toStringAsFixed(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: xs),
      padding: EdgeInsets.all(s),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(FitRadius.m),
        color: FitColor.background(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.start,
                style: FitStyle.b1(context).copyWith(height: 1.2),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                padding: EdgeInsets.all(s),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: FitColor.neutral(context).shade200.withValues(alpha: 0.3),
                ),
                child: Text(widget.emojiText, style: FitStyle.h5(context)),
              ),
            ],
          ),

          SizedBox(height: xs3),

          /// Animated Counter
          AnimatedBuilder(
            animation: _countAnimation,
            builder: (context, child) {
              return RichText(
                text: TextSpan(
                  text: formatValue(_countAnimation.value),
                  style: FitStyle.h4(context),
                  children: [
                    TextSpan(
                      text: "  ${widget.unit}",
                      style: FitStyle.b1(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
