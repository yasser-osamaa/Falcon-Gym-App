import 'package:falcon_gym/features/gym/presentation/view/training_program_view.dart';
import 'package:flutter/material.dart';

class PullDayViewBody extends StatelessWidget {
  const PullDayViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TrainingProgramView(
      title: 'Pull Day',
      subtitle: 'Back • Biceps • Rear Delts',
      exercises: [
        WorkoutExercise(
          name: 'Lat Pulldown',
          muscle: 'Back',
          sets: 4,
          reps: '8-12',
        ),
        WorkoutExercise(
          name: 'Seated Cable Row',
          muscle: 'Back',
          sets: 3,
          reps: '8-12',
        ),
        WorkoutExercise(
          name: 'Dumbbell Row',
          muscle: 'Back',
          sets: 3,
          reps: '10-12',
        ),
        WorkoutExercise(
          name: 'Face Pull',
          muscle: 'Rear Delts',
          sets: 3,
          reps: '12-15',
        ),
        WorkoutExercise(
          name: 'Barbell Curl',
          muscle: 'Biceps',
          sets: 3,
          reps: '8-12',
        ),
      ],
    );
  }
}
