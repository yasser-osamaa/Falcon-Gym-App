import 'package:falcon_gym/features/gym/presentation/view/training_program_view.dart';
import 'package:flutter/material.dart';

class LegDayViewBody extends StatelessWidget {
  const LegDayViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TrainingProgramView(
      title: 'Leg Day',
      subtitle: 'Quads • Hamstrings • Glutes • Calves',
      exercises: [
        WorkoutExercise(name: 'Squat', muscle: 'Quads', sets: 4, reps: '8-12'),
        WorkoutExercise(
          name: 'Leg Press',
          muscle: 'Quads',
          sets: 3,
          reps: '10-12',
        ),
        WorkoutExercise(
          name: 'Romanian Deadlift',
          muscle: 'Hamstrings',
          sets: 3,
          reps: '8-12',
        ),
        WorkoutExercise(
          name: 'Leg Extension',
          muscle: 'Quads',
          sets: 3,
          reps: '12-15',
        ),
        WorkoutExercise(
          name: 'Leg Curl',
          muscle: 'Hamstrings',
          sets: 3,
          reps: '10-15',
        ),
        WorkoutExercise(
          name: 'Calf Raise',
          muscle: 'Calves',
          sets: 4,
          reps: '12-15',
        ),
      ],
    );
  }
}
