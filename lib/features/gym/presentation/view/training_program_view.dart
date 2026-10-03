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
  final List<WorkoutExercise> exercises;
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

class WorkoutExercise {
  const WorkoutExercise({
    required this.name,
    required this.muscle,
    required this.sets,
    required this.reps,
  });

  final String name;
  final String muscle;
  final int sets;
  final String reps;
}
