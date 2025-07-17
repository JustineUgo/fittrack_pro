import 'package:fittrack_pro/core/assets/assets.dart';
import 'package:fittrack_pro/core/route/router.dart';
import 'package:fittrack_pro/core/theme/color.dart';
import 'package:fittrack_pro/core/theme/spacing.dart';
import 'package:fittrack_pro/core/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'intro',
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.rootImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: FitColor.blackColor.withValues(alpha: .6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: xl3),
                  child: Column(
                    children: [
                      SizedBox(height: xl3),
                      Text(
                        "Tailored Personal\nFitness For You",
                        textAlign: TextAlign.center,
                        style: FitStyle.h4(
                          context,
                        ).copyWith(color: FitColor.whiteColor),
                      ),
                      SizedBox(height: xs),
                      Text(
                        "Personlized plans, your pace, your goals - fitness\nthat fits your life.",
                        textAlign: TextAlign.center,
                        style: FitStyle.supportingText(
                          context,
                        ).copyWith(color: FitColor.whiteColor),
                      ),
                      SizedBox(height: s),
                      Divider(
                        indent: xl4,
                        endIndent: xl4,
                        color: FitColor.whiteColor,
                      ),
                      SizedBox(height: s),
                      ElevatedButton(
                        onPressed: () => context.go(RoutePath.dashboard),
                        child: Text("Get Started"),
                      ),
                      SizedBox(height: xl4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
