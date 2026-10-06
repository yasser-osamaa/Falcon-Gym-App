import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/training_program_view_body.dart';
import 'package:falcon_gym/features/home/presentation/views/activites_widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class TrainingProgramView extends StatelessWidget {
  const TrainingProgramView({
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
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomBackButton(),
          ),
        ),
        centerTitle: true,
        title: Text(title),
      ),
      body: TrainingProgramViewBody(
        title: title,
        subtitle: subtitle,
        exercises: exercises,
      ),
    );
  }
}
