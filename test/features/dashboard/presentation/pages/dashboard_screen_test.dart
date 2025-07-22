import 'package:fittrack_pro/core/services/storage_service.dart';
import 'package:fittrack_pro/core/services/workout_service.dart';
import 'package:fittrack_pro/features/dashboard/presentation/bloc/theme_mode/theme_mode_bloc.dart';
import 'package:fittrack_pro/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fittrack_pro/features/workout/presentation/bloc/workout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mock_shared_preferences.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
  });

  Widget createTestWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeModeBloc(
            storage: SharedPreferenceService(mockSharedPreferences),
          ),
        ),
        BlocProvider(
          create: (_) => WorkoutBloc(WorkoutService()),
        ),
      ],
      child: MaterialApp(
        home: DashboardScreen(),
      ),
    );
  }

testWidgets('DashboardScreen shows key sections', (WidgetTester tester) async {
  await tester.pumpWidget(createTestWidget());
  await tester.pumpAndSettle();

  expect(find.text("Hi 👋"), findsOneWidget);
  expect(find.text("Health Overview"), findsOneWidget);

  // Find the CustomScrollView that holds the whole dashboard content
  final scrollable = find.byType(CustomScrollView);

  await tester.drag(scrollable, const Offset(0, -300));
  await tester.pumpAndSettle();

  expect(find.text("Excercises"), findsOneWidget);
  expect(find.byIcon(Icons.cloud), findsOneWidget);
});


  testWidgets('Animated FAB expands and collapses correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    final fab = find.byIcon(Icons.cloud);
    expect(fab, findsOneWidget);

    await tester.tap(fab);
    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    expect(find.byIcon(Icons.light_mode), findsOneWidget);
  });
}
