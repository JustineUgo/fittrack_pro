
import 'package:fittrack_pro/features/workout/domain/entities/workout_data_entity.dart';

abstract class WorkoutEvent {}

class StartWorkout extends WorkoutEvent {}

class StopWorkout extends WorkoutEvent {}

class WorkoutUpdated extends WorkoutEvent {
  final WorkoutData data;

  WorkoutUpdated(this.data);
}
