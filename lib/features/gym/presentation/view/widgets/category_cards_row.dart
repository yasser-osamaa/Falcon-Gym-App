import 'package:falcon_gym/features/gym/presentation/view/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryCardsRow extends StatelessWidget {
  const CategoryCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CategoryCard(
            icon: Icons.fitness_center,
            label: 'MOBILITY',
            title: 'Core & Balance',
            detail: '30 min · 6 exercises',
            iconColor: Color(0xFF34464B),
            iconBackground: Color(0xFFE7ECEC),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CategoryCard(
            icon: Icons.sports_martial_arts,
            label: 'CONDITIONING',
            title: 'Cardio Circuit',
            detail: '25 min · 5 rounds',
            iconColor: Color(0xFF7B6045),
            iconBackground: Color(0xFFF0EAE2),
          ),
        ),
      ],
    );
  }
}
