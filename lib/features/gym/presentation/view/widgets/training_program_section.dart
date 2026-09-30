import 'package:falcon_gym/features/gym/presentation/view/widgets/training_program_card.dart';
import 'package:flutter/material.dart';

class TrainingProgramsSection extends StatelessWidget {
  const TrainingProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TrainingProgramCard(
          number: '01',
          title: 'Push Day',
          detail: 'Chest and shoulders',
          duration: '45 min',
          accentColor: Color(0xFFE7ECEC),
        ),
        SizedBox(height: 8),
        TrainingProgramCard(
          number: '02',
          title: 'Pull Day',
          detail: 'back and back shoulder',
          duration: '45 min',
          accentColor: Color(0xFFF0EAE2),
        ),
        SizedBox(height: 8),
        TrainingProgramCard(
          number: '03',
          title: 'Legs Day',
          detail: 'Legs, glutes and mobility',
          duration: '50 min',
          accentColor: Color(0xFFEAE8EF),
        ),
      ],
    );
  }
}
