import 'package:falcon_gym/features/gym/presentation/view/widgets/category_cards_row.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/training_program_section.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/workout_card.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/gym_intro_card.dart';
import 'package:falcon_gym/features/gym/presentation/view/widgets/heading_texts_section.dart';
import 'package:flutter/material.dart';
import 'package:falcon_gym/core/utils/styless.dart';

class GymViewBody extends StatelessWidget {
  const GymViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Text('Gym Plans', style: Styless.textStyle19)),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              children: const [
                GymIntroCard(),
                SizedBox(height: 22),
                HeadingTextsSection(
                  eyebrow: "TODAY'S TRAINING",
                  title: 'Ready when you are',
                  trailing: '3 workouts',
                ),
                SizedBox(height: 12),
                WorkoutCard(),
                SizedBox(height: 10),
                CategoryCardsRow(),
                SizedBox(height: 22),
                HeadingTextsSection(
                  eyebrow: 'TRAINING PROGRAMS',
                  title: 'Choose your focus',
                ),
                SizedBox(height: 12),
                TrainingProgramsSection(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
