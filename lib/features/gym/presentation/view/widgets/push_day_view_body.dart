import 'package:falcon_gym/features/gym/presentation/view/training_program_view.dart';
import 'package:flutter/material.dart';

class PushDayViewBody extends StatelessWidget {
  const PushDayViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TrainingProgramView(
      title: 'Push Day',
      subtitle: 'Chest • Shoulders • Triceps',
      exercises: [
        WorkoutExercise(
          name: 'Bench Press',
          muscle: 'Chest',
          sets: 4,
          reps: '8-12',
        ),
        WorkoutExercise(
          name: 'Incline Dumbbell Press',
          muscle: 'Chest',
          sets: 3,
          reps: '10-12',
        ),
        WorkoutExercise(
          name: 'Shoulder Press',
          muscle: 'Shoulders',
          sets: 3,
          reps: '8-12',
        ),
        WorkoutExercise(
          name: 'Lateral Raises',
          muscle: 'Shoulders',
          sets: 3,
          reps: '12-15',
        ),
        WorkoutExercise(
          name: 'Triceps Pushdown',
          muscle: 'Triceps',
          sets: 3,
          reps: '10-15',
        ),
      ],
    );
  }
}
