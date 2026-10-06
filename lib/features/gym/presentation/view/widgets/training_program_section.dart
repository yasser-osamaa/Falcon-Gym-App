import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/features/gym/presentation/view/manager/cubit/gym_exercises_cubit.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/training_program_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TrainingProgramsSection extends StatelessWidget {
  const TrainingProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrainingProgramCard(
          onTap: () {
            context.read<GymExercisesCubit>().fetchExercises(categoryId: 1);

            context.push(AppRouter.kPushView);
          },
          number: '01',
          title: 'Push Day',
          detail: 'Chest, Shoulders, Triceps',
          duration: '45 min',
          accentColor: Color(0xFFE7ECEC),
        ),
        SizedBox(height: 8),
        TrainingProgramCard(
          onTap: () {
            context.read<GymExercisesCubit>().fetchExercises(categoryId: 2);

            context.push(AppRouter.kPullView);
          },
          number: '02',
          title: 'Pull Day',
          detail: 'Back, Biceps, Rear Delts',
          duration: '45 min',
          accentColor: Color(0xFFF0EAE2),
        ),
        SizedBox(height: 8),
        TrainingProgramCard(
          onTap: () {
            context.read<GymExercisesCubit>().fetchExercises(categoryId: 3);

            context.push(AppRouter.kLegView);
          },
          number: '03',
          title: 'Legs Day',
          detail: 'Quads, Hamstrings, Glutes, Calves',
          duration: '50 min',
          accentColor: Color(0xFFEAE8EF),
        ),
      ],
    );
  }
}
