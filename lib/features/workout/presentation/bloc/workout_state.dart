import 'package:fittrack_pro/features/workout/domain/entities/workout_data_entity.dart';

abstract class WorkoutState {}

class WorkoutInitial extends WorkoutState {}

class WorkoutInProgress extends WorkoutState {
  final WorkoutData data;

  WorkoutInProgress(this.data);
}

class WorkoutStopped extends WorkoutState {}

class WorkoutError extends WorkoutState {
  final String message;

  WorkoutError(this.message);
}
