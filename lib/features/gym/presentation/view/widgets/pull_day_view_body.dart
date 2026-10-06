import 'package:falcon_gym/core/widgets/error_view.dart';
import 'package:falcon_gym/core/widgets/exercise_card_shimmer.dart';
import 'package:falcon_gym/features/gym/presentation/view/manager/cubit/gym_exercises_cubit.dart';
import 'package:falcon_gym/features/gym/presentation/view/training_program_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PullDayViewBody extends StatelessWidget {
  const PullDayViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymExercisesCubit, GymExercisesState>(
      builder: (context, state) {
        if (state is GymExercisesSuccess) {
          return TrainingProgramView(
            title: 'Pull Day',
            subtitle: 'Back • Biceps • Rear Delts',
            exercises: state.gymExercises,
          );
        } else if (state is GymExercisesFailure) {
          return Scaffold(
            body: ErrorView(title: state.errorText, icon: Icons.error),
          );
        }
        return Scaffold(
          body: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return const ExerciseCardShimmer();
            },
            separatorBuilder: (_, _) => const SizedBox(height: 20),

            itemCount: 4,
          ),
        );
      },
    );
  }
}
