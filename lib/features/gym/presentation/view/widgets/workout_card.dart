import 'package:falcon_gym/features/gym/presentation/view/widgets/workout_texts_column.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        height: 148,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/gym.jpg', fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xCC111719), Color(0x22111719)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: WorkOutTextColumn()),
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.18),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white38),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
