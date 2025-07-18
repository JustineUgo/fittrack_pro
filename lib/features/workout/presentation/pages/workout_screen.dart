import 'package:fittrack_pro/core/assets/assets.dart';
import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key, required this.tag});
  final String tag;
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller = VideoPlayerController.asset(Assets.workoutVideo)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onPlay() {
    animationController.forward();

    _controller.setLooping(true);
    _controller.play();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.tag,
        child: OrientationBuilder(
          builder: (context, orientation) {
            bool isHorizontal = orientation == Orientation.landscape;
            return Stack(
              children: [
                _controller.value.isPlaying
                    ? Center(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: FitColor.greyBackground(context),
                          image: DecorationImage(image: AssetImage(widget.tag)),
                        ),
                      ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  top: isHorizontal
                      ? 0
                      : MediaQuery.of(context).size.width * 1.2,
                  right: isHorizontal
                      ? MediaQuery.of(context).size.height * 1.5
                      : 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: FitColor.accent(context),
                      borderRadius: BorderRadius.circular(FitRadius.l),
                      boxShadow: [
                        BoxShadow(
                          color: FitColor.blackColor.withValues(alpha: .5),
                          blurRadius: 16,
                          spreadRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: l),
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            FitColor.primary(context).withValues(alpha: .3),
                            FitColor.primary(context).withValues(alpha: 0),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Prev", style: FitStyle.h7(context)),
                          GestureDetector(
                            onTap: onPlay,
                            child: AnimatedIcon(
                              icon: AnimatedIcons.play_pause,
                              progress: animationController,
                              size: 40,
                            ),
                          ),

                          Text("Next", style: FitStyle.h7(context)),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: FitColor.neutral(context).shade200,
                      ),
                      child: Icon(CupertinoIcons.clear),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 60,
                        child: Container(
                          height: 60,

                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.heart),
                            ),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "80",
                          style: FitStyle.h4(context),
                          children: [
                            TextSpan(
                              text: " bpm",
                              style: FitStyle.supportingText(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
