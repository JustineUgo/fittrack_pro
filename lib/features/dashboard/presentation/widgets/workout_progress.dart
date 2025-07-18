import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:flutter/material.dart';

class WorkoutProgress extends StatelessWidget {
  const WorkoutProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: xl, horizontal: xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Workout Progress",
            style: FitStyle.h6(context).copyWith(fontWeight: FontWeight.w300),
          ),
          SizedBox(height: xs),
          Container(
            padding: EdgeInsets.symmetric(horizontal: m, vertical: xl3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(FitRadius.s),
              color: FitColor.primary(context),
            ),
            child: WorkoutChart(),
          ),
        ],
      ),
    );
  }
}

class WorkoutChart extends StatefulWidget {
  const WorkoutChart({super.key});

  @override
  State<WorkoutChart> createState() => _WorkoutChartState();
}

class _WorkoutChartState extends State<WorkoutChart>
    with SingleTickerProviderStateMixin {
  List<int> workoutData = [3, 5, 2, 6, 4, 7, 1];

  late AnimationController controller;
  late Animation<double> animation;

  int? selectedIndex;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.forward();
  }

  void handleTap(Offset tapPosition, BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final spacing = width / (workoutData.length - 1);

    final tappedX = tapPosition.dx;
    final index = (tappedX / spacing).round().clamp(0, workoutData.length - 1);

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTapDown: (details) => handleTap(details.localPosition, constraints),
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    painter: LineChartPainter(
                      workoutData,
                      animation.value,
                      selectedIndex,
                    ),
                    size: Size(MediaQuery.of(context).size.width - 80, 100),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class LineChartPainter extends CustomPainter {
  final List<int> data;
  final double animationValue;
  final int? selectedIndex;

  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  LineChartPainter(this.data, this.animationValue, this.selectedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = FitColor.yellow
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = FitColor.yellow
      ..style = PaintingStyle.fill;

    final highlightPaint = Paint()
      ..color = FitColor.whiteColor
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final path = Path();
    final spacing = size.width / (data.length - 1);
    final maxY = (data.reduce((a, b) => a > b ? a : b)).ceilToDouble();
    final minY = 0.0;

    // Compute smoothed points
    List<Offset> points = [];

    for (int i = 0; i < data.length; i++) {
      final x = i * spacing;
      final y =
          size.height -
          ((data[i] - minY) / (maxY - minY)) * size.height * animationValue;
      points.add(Offset(x, y));
    }

    // Draw smooth curve
    if (points.length > 1) {
      path.moveTo(points[0].dx, points[0].dy);
      for (int i = 0; i < points.length - 1; i++) {
        final p1 = points[i];
        final p2 = points[i + 1];
        final mid = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
        path.quadraticBezierTo(p1.dx, p1.dy, mid.dx, mid.dy);
      }
      // Last segment
      path.lineTo(points.last.dx, points.last.dy);
    }

    canvas.drawPath(path, stroke);

    // Draw dots and highlights
    for (int i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], 5, dotPaint);

      if (selectedIndex == i) {
        // Draw highlight circle
        canvas.drawCircle(points[i], 8, highlightPaint);

        // Draw value above the highlight circle
        final valueText = TextSpan(
          text: "${data[i]}",
          style: TextStyle(color: FitColor.whiteColor, fontSize: 14),
        );

        textPainter.text = valueText;
        textPainter.layout();

        final textOffset = Offset(
          points[i].dx - textPainter.width / 2,
          points[i].dy - textPainter.height - 10,
        );

        textPainter.paint(canvas, textOffset);
      }
    }

    // Draw day labels
    for (int i = 0; i < days.length; i++) {
      final text = TextSpan(
        text: days[i],
        style: TextStyle(color: FitColor.whiteColor, fontSize: 12),
      );

      textPainter.text = text;
      textPainter.layout();

      final x = i * spacing - textPainter.width / 2;
      final y = size.height + 4;
      textPainter.paint(canvas, Offset(x, y));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
