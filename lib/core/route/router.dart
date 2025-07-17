import 'package:fittrack_pro/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fittrack_pro/features/root/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.root,
      builder: (BuildContext context, GoRouterState state) {
        return const Root();
      },
    ),
    GoRoute(
      path: RoutePath.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen();
      },
    ),
    
  ],
);

class RoutePath {
  static const String root = '/';
  static const String dashboard = '/dashboard';
  static const String workout = '/workout';
}
