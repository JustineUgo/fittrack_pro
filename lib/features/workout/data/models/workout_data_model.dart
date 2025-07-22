
import 'package:fittrack_pro/features/workout/domain/entities/workout_data_entity.dart';

class WorkoutDataModel extends WorkoutData {
  WorkoutDataModel({required super.heartRate, required super.steps, required super.calories});
      
 
  factory WorkoutDataModel.fromMap(Map<String, dynamic> map) {
    return WorkoutDataModel(
      heartRate: map['heartRate'] ?? 0,
      steps: map['steps'] ?? 0,
      calories: (map['calories'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
