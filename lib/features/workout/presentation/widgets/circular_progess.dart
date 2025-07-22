
import 'dart:math';

import 'package:flutter/material.dart';

class SegmentedCircularProgress extends StatelessWidget {
  final Duration current;
  final Duration total;
  final List<Duration> segments;

  const SegmentedCircularProgress({
    super.key,
    required this.current,
    required this.total,
    required this.segments,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(160, 160),
      painter: SegmentedProgressPainter(current, total, segments),
    );
  }
}

class SegmentedProgressPainter extends CustomPainter {
  final Duration current;
  final Duration total;
  final List<Duration> segments;

  SegmentedProgressPainter(this.current, this.total, this.segments);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 12.0;
    final radius = size.width / 2;
    final center = Offset(radius, radius);

    final totalSeconds = total.inSeconds.toDouble();
    final currentSeconds = current.inSeconds.toDouble();

    double startAngle = -pi / 2;
    final segmentColors = [Colors.orange, Colors.greenAccent, Colors.blue];

    // Draw each segment
    for (int i = 0; i < segments.length; i++) {
      final sweep = (segments[i].inSeconds / totalSeconds) * 2 * pi;
      final paint = Paint()
        ..color = segmentColors[i % segmentColors.length].withValues(alpha: 0.3)
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweep,
        false,
        paint,
      );
      startAngle += sweep;
    }

    // Draw animated progress
    final progressPaint = Paint()
      ..shader = SweepGradient(
        colors: [Colors.white, Colors.greenAccent],
        startAngle: 0,
        endAngle: 2 * pi,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressAngle = (currentSeconds / totalSeconds) * 2 * pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -pi / 2,
      progressAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
