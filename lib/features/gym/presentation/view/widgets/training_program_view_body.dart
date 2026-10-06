import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/exercise_card_list_view.dart';
import 'package:flutter/material.dart';

class TrainingProgramViewBody extends StatelessWidget {
  const TrainingProgramViewBody({
    super.key,
    required this.title,
    required this.subtitle,
    required this.exercises,
  });

  final String title;
  final String subtitle;
  final List<GymExercisesEntity> exercises;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          Text(
            '$title Workout',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(
            subtitle,
            style: Styless.textStyle15.copyWith(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          Expanded(child: ExerciseCardListView(exercises: exercises)),
        ],
      ),
    );
  }
}
