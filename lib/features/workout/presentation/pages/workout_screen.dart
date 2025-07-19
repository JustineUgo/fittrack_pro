import 'dart:async';
import 'dart:math';
import 'package:fittrack_pro/core/assets/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WorkoutScreen extends StatefulWidget {
  final String tag;

  const WorkoutScreen({super.key, required this.tag});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>
    with SingleTickerProviderStateMixin {
  Timer? timer;
  late VideoPlayerController controller;
  late AnimationController pulseController;
  late Animation<double> pulseAnimation;

  late Timer videoProgressTimer;
  Duration currentPosition = Duration.zero;

  int heartRate = 80;
  double progress = 0.6; // 60% workout progress

  @override
  void initState() {
    super.initState();

    // Video controller
    controller = VideoPlayerController.asset(Assets.workoutVideo)
      ..initialize().then((_) {
        controller.addListener(() {
          if (controller.value.isInitialized) {
            setState(() {
              currentPosition = controller.value.position;
            });
          }
        });

        setState(() {});
        // controller.play();
        // controller.setLooping(true);
      });

    // Pulse animation for heart
    pulseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);

    pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
    );

    // Simulate live heart rate update
    timer = Timer.periodic(Duration(seconds: 2), (_) {
      setState(() {
        heartRate = 70 + Random().nextInt(20); // Random 70–90 bpm
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    pulseController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blueGrey.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity != null) {
              if (details.primaryVelocity! > 0) {
                // Swipe right → Fast-forward
                final newPosition =
                    controller.value.position + Duration(seconds: 2);
                final maxDuration = controller.value.duration;

                controller.seekTo(
                  newPosition < maxDuration ? newPosition : maxDuration,
                );
              } else if (details.primaryVelocity! < 0) {
                // Swipe left → Rewind
                final newPosition =
                    controller.value.position - Duration(seconds: 2);

                controller.seekTo(
                  newPosition > Duration.zero ? newPosition : Duration.zero,
                );
              }
            }
          },

          onVerticalDragEnd: (details) {
            if (details.primaryVelocity != null &&
                details.primaryVelocity! > 0) {
              setState(() {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
              });
            }
          },
          child: Stack(
            children: [
              
              
              controller.value.isPlaying
                  ? Center(
                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller),
                      ),
                    )
                  : Hero(
                      tag: widget.tag,
                      child: Image.asset(
                        widget.tag,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),

              
              Positioned(
                top: 60,
                left: 16,
                child: Row(
                  children: [
                    AnimatedBuilder(
                      animation: pulseAnimation,
                      builder: (_, child) {
                        return Transform.scale(
                          scale: pulseAnimation.value,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Assets.heart),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: "$heartRate",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: " bpm",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              
              DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.4,
                builder: (context, scrollController) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: .9),
                          Colors.blueGrey.shade800,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              margin: EdgeInsets.symmetric(vertical: 24),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),

                          
                          Center(
                            child: SegmentedCircularProgress(
                              current: currentPosition,
                              total: controller.value.isInitialized
                                  ? controller.value.duration
                                  : Duration.zero,
                              segments: [
                                Duration(seconds: 15),
                                Duration(seconds: 60),
                                Duration(seconds: 15),
                              ],
                            ),
                          ),
                          SizedBox(height: 32),

                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Prev",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (controller.value.isPlaying) {
                                      controller.pause();
                                    } else {
                                      controller.play();
                                    }
                                  });
                                },
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 300),
                                  transitionBuilder: (child, animation) {
                                    return ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    );
                                  },
                                  child: Icon(
                                    controller.value.isPlaying
                                        ? Icons.pause_circle_filled
                                        : Icons.play_circle_fill,
                                    key: ValueKey(controller.value.isPlaying),
                                    size: 56,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              
              Positioned(
                top: 60,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                    child: Icon(CupertinoIcons.clear, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        ..color = segmentColors[i % segmentColors.length].withOpacity(0.3)
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
