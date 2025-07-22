import 'dart:developer';
import 'package:flutter/services.dart';

class WorkoutService {
  static const MethodChannel _channel = MethodChannel('fittrack/workout');

  Function(Map<String, dynamic>)? onWorkoutUpdate;

  WorkoutService() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onWorkoutUpdate') {
        final Map<String, dynamic> data = Map<String, dynamic>.from(call.arguments);
        if (onWorkoutUpdate != null) {
          onWorkoutUpdate!(data);
        }
      }
    });
  }

  Future<void> startWorkout() async {
    try {
      final result = await _channel.invokeMethod('startWorkout');
      log(result);
    } on PlatformException catch (e) {
      throw WorkoutException('Failed to start workout: ${e.message}');
    }
  }

  Future<void> stopWorkout() async {
    try {
      final result = await _channel.invokeMethod('stopWorkout');
      log(result);
    } on PlatformException catch (e) {
      throw WorkoutException('Failed to stop workout: ${e.message}');
    }
  }
}

class WorkoutException implements Exception {
  final String message;
  WorkoutException(this.message);

  @override
  String toString() => 'WorkoutException: $message';
}
