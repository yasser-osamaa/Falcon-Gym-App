import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/exercise_card.dart';
import 'package:flutter/material.dart';

class ExerciseCardListView extends StatelessWidget {
  const ExerciseCardListView({super.key, required this.exercises});

  final List<GymExercisesEntity> exercises;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: exercises.length,
      separatorBuilder: (_, _) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final exercise = exercises[index];

        return ExercieseCard(exercise: exercise);
      },
    );
  }
}
