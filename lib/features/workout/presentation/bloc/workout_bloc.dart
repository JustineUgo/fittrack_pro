import 'dart:async';
import 'package:fittrack_pro/core/services/workout_service.dart';
import 'package:fittrack_pro/features/workout/data/models/workout_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'workout_event.dart';
import 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutService _workoutService;
  StreamSubscription? _subscription;

  WorkoutBloc(this._workoutService) : super(WorkoutInitial()) {
    _workoutService.onWorkoutUpdate = (data) {
      add(WorkoutUpdated(WorkoutDataModel.fromMap(data)));
    };

    on<StartWorkout>((event, emit) async {
      try {
        await _workoutService.startWorkout();
      } catch (e) {
        emit(WorkoutError(e.toString()));
      }
    });

    on<WorkoutUpdated>((event, emit) {
      emit(WorkoutInProgress(event.data));
    });

    on<StopWorkout>((event, emit) async {
      try {
        await _workoutService.stopWorkout();
        emit(WorkoutStopped());
      } catch (e) {
        emit(WorkoutError(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
